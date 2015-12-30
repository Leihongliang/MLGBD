//
//  AwkardTableViewCell.h
//  
//
//  Created by qianfeng007 on 15/12/1.
//
//

#import <UIKit/UIKit.h>
#import "AwkardModel.h"
@interface AwkardTableViewCell : UITableViewCell
- (void)initWithDataWith:(ItemsModel *)model;

@property (nonatomic, assign) CGFloat cellHeight;
@end
