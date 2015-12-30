//
//  AwkardModel.m
//  baike
//
//  Created by qianfeng007 on 15/11/30.
//  Copyright © 2015年 李东亚. All rights reserved.
//

#import "AwkardModel.h"

@implementation ItemsModel

+ (JSONKeyMapper *)keyMapper {
    
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"id":@"itemID",@"votes.down":@"votesDown",@"votes.up":@"votesUp",@"user.avatar_updated_at":@"userAvatar",@"user.last_visited_at":@"userLastV",@"user.created_at":@"userCreated",@"user.state":@"userState",@"user.email":@"userEmail",@"user.last_device":@"userLastD",@"user.role":@"userRole",@"user.login":@"userLogin",@"user.id":@"userID",@"user.icon":@"userIcon"}];
}

@end

@implementation AwkardModel

@end

@implementation ImageSizeModel


@end