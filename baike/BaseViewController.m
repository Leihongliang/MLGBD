//
//  BaseViewController.m
//  baike
//
//  Created by qianfeng007 on 15/11/30.
//  Copyright © 2015年 李东亚. All rights reserved.
//

#import "BaseViewController.h"
#import  <AFNetworking/AFNetworking.h>
#import "AwkardModel.h"
#import <MJRefresh/MJRefresh.h>
#import "AwkardTableViewCell.h"
#define Url @"http://m2.qiushibaike.com/article/list/latest?count=10&page=1"
@interface BaseViewController ()<UITableViewDataSource, UITableViewDelegate> {
    AwkardModel *_model;
    UITableView *_tableView;
    NSMutableArray *_dataArray;
    CGFloat cellHeight;
}
@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createTableView];
    _dataArray = [[NSMutableArray alloc] init];
}

- (void)loadDataForNet:(BOOL)isMore {
    NSInteger page = 1;
    //    self.currentPage = 1;
    
    if (isMore) {
        if (_dataArray.count%20 == 0) {
            
            page = _dataArray.count/20 + 1;
        } else {
            
            [_tableView.mj_footer endRefreshing];
            return;
        }
    }
    NSString *url = LastestURLString(20, 1);
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        if (!isMore) {
            [_dataArray removeAllObjects];
            [_tableView reloadData];
        }
    _model = [[AwkardModel alloc] initWithData:responseObject error:nil];
    [_dataArray addObjectsFromArray:_model.items];
    [_tableView reloadData];
        
    isMore?[_tableView.mj_footer endRefreshing]:[_tableView.mj_header endRefreshing];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
     isMore?[_tableView.mj_footer endRefreshing]:[_tableView.mj_header endRefreshing];
    }];

}
- (void)createTableView {
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    UIImageView *backGView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pulish_bg"]];
    backGView.frame = CGRectMake(0, 0, VIEW_WIDTH, VIEW_HEIGHT- 108);
    _tableView.backgroundView = backGView;
    
    [self.view addSubview:_tableView];
    
    MJRefreshNormalHeader *refreshHeader = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self loadDataForNet:NO];
    }];
    
    _tableView.mj_header = refreshHeader;
    MJRefreshBackNormalFooter *refreshFooter = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self loadDataForNet:YES];
    }];
    _tableView.mj_footer = refreshFooter;
    [refreshHeader beginRefreshing];

}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"cellID";
    AwkardTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[AwkardTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    ItemsModel *model = _dataArray[indexPath.row];
    [cell initWithDataWith:model];
    cellHeight = cell.cellHeight;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return cellHeight;
    
}
- (void)didReceiveMemoryWarning {
        [super didReceiveMemoryWarning];
        // Dispose of any resources that can be recreated.
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
