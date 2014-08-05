//
//  AppDelegate.m
//  PickerView
//
//  Created by Alexey Bukhtin on 03.08.13.
//  Copyright (c) 2013 Cheapshot. All rights reserved.
//

#import "AppDelegate.h"
#import "SuperViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    UINavigationController *navigationController =
    [[UINavigationController alloc] initWithRootViewController:[SuperViewController new]];
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
