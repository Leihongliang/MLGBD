//
//  AppDelegate.m
//  baike
//
//  Created by qianfeng007 on 15/11/30.
//  Copyright © 2015年 李东亚. All rights reserved.
//

#import "AppDelegate.h"
#import "BaseViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self createTabBarController];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}
- (void)createTabBarController {
    UITabBarController *tbc = [[UITabBarController alloc] init];
    NSMutableArray *navigation = [NSMutableArray new];
    NSArray *title = @[@"最糗",@"最新",@"我的糗百"];
    NSArray *views = @[@"awkwardViewController",@"NewViewController",@"MyViewController"];
    NSArray *backImage = @[@"top",@"new",@"my"];
    for (int i=0 ; i<title.count; i++) {
        Class class = NSClassFromString(views[i]);
        UIImage *image = [[UIImage imageNamed:[NSString stringWithFormat:@"icon_%@_enable",backImage[i]]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UIImage *Simage = [[UIImage imageNamed:[NSString stringWithFormat:@"icon_%@_active",backImage[i]]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:title[i] image:image selectedImage:Simage];
        BaseViewController *bvc =[[class alloc] init];
        bvc.title = title[i];
        bvc.tabBarItem = item;
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:bvc];
        [navigation addObject:nav];
    }
    tbc.viewControllers = navigation;
    tbc.tabBar.backgroundImage = [UIImage imageNamed:@"bar_background@2x"];
    self.window.rootViewController = tbc;
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
