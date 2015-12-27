//
//  AppDelegate.swift
//  MyNews
//
//  Created by 赫腾飞 on 15/12/23.
//  Copyright © 2015年 hetefe. All rights reserved.
//

/**

@property (strong, readwrite, nonatomic) IBInspectable NSString *contentViewStoryboardID;
@property (strong, readwrite, nonatomic) IBInspectable NSString *leftMenuViewStoryboardID;
@property (strong, readwrite, nonatomic) IBInspectable NSString *rightMenuViewStoryboardID;
#endif

@property (strong, readwrite, nonatomic) UIViewController *contentViewController;
@property (strong, readwrite, nonatomic) UIViewController *leftMenuViewController;
@property (strong, readwrite, nonatomic) UIViewController *rightMenuViewController;
@property (weak, readwrite, nonatomic) id<RESideMenuDelegate> delegate;

@property (assign, readwrite, nonatomic) NSTimeInterval animationDuration;
@property (strong, readwrite, nonatomic) UIImage *backgroundImage;

@property (assign, readwrite, nonatomic) BOOL panGestureEnabled;
@property (assign, readwrite, nonatomic) BOOL panFromEdge;

@property (assign, readwrite, nonatomic) NSUInteger panMinimumOpenThreshold;
@property (assign, readwrite, nonatomic) IBInspectable BOOL interactivePopGestureRecognizerEnabled;
@property (assign, readwrite, nonatomic) IBInspectable BOOL fadeMenuView;
@property (assign, readwrite, nonatomic) IBInspectable BOOL scaleContentView;
@property (assign, readwrite, nonatomic) IBInspectable BOOL scaleBackgroundImageView;
@property (assign, readwrite, nonatomic) IBInspectable BOOL scaleMenuView;
@property (assign, readwrite, nonatomic) IBInspectable BOOL contentViewShadowEnabled;
@property (strong, readwrite, nonatomic) IBInspectable UIColor *contentViewShadowColor;
@property (assign, readwrite, nonatomic) IBInspectable CGSize contentViewShadowOffset;
@property (assign, readwrite, nonatomic) IBInspectable CGFloat contentViewShadowOpacity;
@property (assign, readwrite, nonatomic) IBInspectable CGFloat contentViewShadowRadius;
@property (assign, readwrite, nonatomic) IBInspectable CGFloat contentViewFadeOutAlpha;
@property (assign, readwrite, nonatomic) IBInspectable CGFloat contentViewScaleValue;
@property (assign, readwrite, nonatomic) IBInspectable CGFloat contentViewInLandscapeOffsetCenterX;
@property (assign, readwrite, nonatomic) IBInspectable CGFloat contentViewInPortraitOffsetCenterX;
@property (assign, readwrite, nonatomic) IBInspectable CGFloat parallaxMenuMinimumRelativeValue;
@property (assign, readwrite, nonatomic) IBInspectable CGFloat parallaxMenuMaximumRelativeValue;
@property (assign, readwrite, nonatomic) IBInspectable CGFloat parallaxContentMinimumRelativeValue;
@property (assign, readwrite, nonatomic) IBInspectable CGFloat parallaxContentMaximumRelativeValue;
@property (assign, readwrite, nonatomic) CGAffineTransform menuViewControllerTransformation;
@property (assign, readwrite, nonatomic) IBInspectable BOOL parallaxEnabled;
@property (assign, readwrite, nonatomic) IBInspectable BOOL bouncesHorizontally;
@property (assign, readwrite, nonatomic) UIStatusBarStyle menuPreferredStatusBarStyle;
@property (assign, readwrite, nonatomic) IBInspectable BOOL menuPrefersStatusBarHidden;
*/

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window?.backgroundColor = UIColor.whiteColor()
        
        let leftVC = LeftViewController()
        let rightVC = RightViewController()
        
        let sideMenuViewController: RESideMenu  = RESideMenu(contentViewController: MainTabBarController(), leftMenuViewController: leftVC, rightMenuViewController: rightVC)
       
        
        //设置背景的
        sideMenuViewController.backgroundImage = UIImage(named: "Stars")
        
        //TODO: 未知属性
        sideMenuViewController.menuPrefersStatusBarHidden = false
        sideMenuViewController.menuPreferredStatusBarStyle = .LightContent
        
        //设置side和mainView之间的阴影效果
        
        sideMenuViewController.contentViewShadowColor = UIColor.blackColor()
        sideMenuViewController.contentViewShadowOffset = CGSizeMake(0, 0)
        sideMenuViewController.contentViewShadowOpacity = 0.6
        sideMenuViewController.contentViewShadowRadius = 12
        sideMenuViewController.contentViewShadowEnabled = true
        
        //在ContentView上滑动抽屉的效果控制
        sideMenuViewController.bouncesHorizontally = true
        //是否缩放ContentView
        sideMenuViewController.scaleContentView = false
        
        // panFromEdge允许拖动界面边界执行 滑动抽屉效果 不仅限于按钮的动作
        sideMenuViewController.panFromEdge = false
        //panGestureEnabled与panFromEdge的是对同一性能的不同设置 但是执行效果是完全不同的
        sideMenuViewController.panGestureEnabled = true
       //背景图片的渐变效果
        sideMenuViewController.fadeMenuView = true
       
        
        
        // 管理 以下 设置是否起作用
        sideMenuViewController.parallaxEnabled = false
        //控制主视图在抽屉中左右分占比例
        sideMenuViewController.parallaxContentMaximumRelativeValue = 100
        sideMenuViewController.parallaxContentMinimumRelativeValue = 100
        
        
        //TODO: 未找到对应效果
        //        sideMenuViewController.parallaxMenuMinimumRelativeValue = 100
        //                sideMenuViewController.parallaxMenuMaximumRelativeValue = 100
        
        // CGAffineTransform: menuViewControllerTransformation;
        //        sideMenuViewController.menuViewControllerTransformation = CGAffineTransform(a: 100, b: 0, c: 0, d: 0, tx: 100, ty: 100)
        
        //TODO: 待处理
        //        sideMenuViewController.panMinimumOpenThreshold = 1
        
        window?.rootViewController = sideMenuViewController//MainTabBarController()
        
        print(window?.frame)
        window?.makeKeyAndVisible()
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

