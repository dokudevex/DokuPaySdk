//
//  SettingPageViewViewController.h
//  DokuPayDemo
//
//  Created by Dedye on 26/06/20.
//  Copyright © 2020 Doku. All rights reserved.
//

#import "ViewController.h"
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "AppDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface SettingPageViewViewController : ViewController

@property (weak, nonatomic) IBOutlet UIView *popUpView;

- (void)showInView:(UIView *)aView animated:(BOOL)animated;

@end

NS_ASSUME_NONNULL_END
