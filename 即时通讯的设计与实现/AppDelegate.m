//
//  AppDelegate.m
//  即时通讯的设计与实现
//
//  Created by 曹轩 on 2018/4/21.
//  Copyright © 2018年 曹轩. All rights reserved.
//

#import "AppDelegate.h"
// 登录
#import "QRMLoginVC.h"

#import "QRMPersonVC.h"
#import "QRMAddFriendVC.h"
#import "QRMChatListVC.h"
//键盘
#import "IQKeyboardManager.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];

    self.window.backgroundColor=[UIColor whiteColor];

    [self addVCS];
    [self addXinHeIQKeyboardManager];
    //创建主屏幕
    [self.window makeKeyAndVisible];

    return YES;
}

-(void)addVCS{
    
    //如果userid==nil 直接去登录界面
    NSUserDefaults *defult=[NSUserDefaults standardUserDefaults];
    NSString *userId=[defult objectForKey:@"userId"];
    if (userId==nil) {
        QRMLoginVC *logvc=[[QRMLoginVC alloc]init];
        logvc.title=@"登录";
        UINavigationController *nvc=[[UINavigationController alloc]initWithRootViewController:logvc];
        self.window.rootViewController=nvc;
    }
    else{

    QRMPersonVC *vc0=[[QRMPersonVC alloc]init];
    UINavigationController *nvc0=[[UINavigationController alloc]initWithRootViewController:vc0];
    vc0.title=@"个人中心";
    nvc0.tabBarItem.image=[[UIImage imageNamed:@"1-1"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    nvc0.tabBarItem.selectedImage=[[UIImage imageNamed:@"1"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

    
    QRMChatListVC *vc1=[[QRMChatListVC alloc]init];
    UINavigationController *nvc1=[[UINavigationController alloc]initWithRootViewController:vc1];
    vc1.title=@"好友列表";
    nvc1.tabBarItem.image=[[UIImage imageNamed:@"4-1"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    nvc1.tabBarItem.selectedImage=[[UIImage imageNamed:@"4"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
    QRMAddFriendVC *vc2=[[QRMAddFriendVC alloc]init];
    UINavigationController *nvc2=[[UINavigationController alloc]initWithRootViewController:vc2];
    vc2.title=@"添加好友";
    nvc2.tabBarItem.image=[[UIImage imageNamed:@"5-1的副本"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    nvc2.tabBarItem.selectedImage=[[UIImage imageNamed:@"5"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

    
    [[UITabBarItem appearance] setTitleTextAttributes:@{ NSForegroundColorAttributeName:[UIColor redColor]} forState:UIControlStateSelected];
    
    //创建一个数组包含四个导航栏控制器
    NSArray *vcArry = [NSArray arrayWithObjects:nvc0,nvc1,nvc2,nil];
    
    UITabBarController  *TVC=[[UITabBarController alloc]init];
    TVC.viewControllers=vcArry;
    
    self.window.rootViewController=TVC;
    }
}


- (void)applicationWillResignActive:(UIApplication *)application {
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

-(void)addXinHeIQKeyboardManager{
    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
    manager.enable = YES;
    manager.shouldResignOnTouchOutside = YES;
    manager.shouldToolbarUsesTextFieldTintColor = YES;
    manager.enableAutoToolbar = YES;
    
}

@end
