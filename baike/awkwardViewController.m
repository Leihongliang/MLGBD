//
//  awkwardViewController.m
//  baike
//
//  Created by qianfeng007 on 15/11/30.
//  Copyright © 2015年 李东亚. All rights reserved.
//

#import "awkwardViewController.h"
#import <AFNetworking/AFNetworking.h>
#define url @"http://m2.qiushibaike.com/article/list/latest?count=10&page=1"
@interface awkwardViewController ()

@end

@implementation awkwardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //[self createTableView];
}
//- (void)createTableView {
//    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
//    _tableView.delegate = self;
//    _tableView.dataSource = self;
//    
//    [self.view addSubview:_tableView];
//}
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return 20;
//}
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    static NSString *identifier = @"cellID";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
//    }
//    return cell;
//}
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
