//
//  AppDelegate.m
//  DokuPayDemo
//
//  Created by Dedye on 12/06/20.
//  Copyright © 2020 Doku. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self createToDoView];
    return YES;
}

- (void)createToDoView {
    self.window = [[UIWindow alloc] initWithFrame: [[UIScreen mainScreen] bounds]];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName: @"Main"
                                                         bundle: [NSBundle bundleForClass:self.class]];
    ViewController *viewController = [storyboard instantiateViewControllerWithIdentifier: @"ViewController"];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController: viewController];
    self.window.rootViewController = navigationController;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
}

@end
