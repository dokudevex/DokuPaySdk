//
//  SettingPageViewViewController.m
//  DokuPayDemo
//
//  Created by Dedye on 26/06/20.
//  Copyright © 2020 Doku. All rights reserved.
//

#import "SettingPageViewController.h"
#import "Masonry.h"
#import <ActionSheetPicker.h>
#import "DokuUtils.h"
#import "DokuConstants.h"

@implementation SettingPageViewController 

#pragma mark - Life cycle

- (void)didMoveToSuperview {
    [super didMoveToSuperview];
    
    self.environmentServer = @[@"SandBox",
                               @"Production"];
    
    self.activePageResult = @[@"YES",
                              @"NO"];
    
    self.textFieldEnvironmentServer.dokuTextFieldDelegate = self;
    self.textFieldActiveResultPage.dokuTextFieldDelegate = self;
    
    NSString *getClientId = [DokuUtils getValueFromNSUserDefaultForKey: clientId];
    NSString *getMerchantName = [DokuUtils getValueFromNSUserDefaultForKey: merchantName];
    NSString *getSharedKey = [DokuUtils getValueFromNSUserDefaultForKey: sharedKey];
    NSString *getEnvironmentServer = [DokuUtils getValueFromNSUserDefaultForKey: environmentServer];
    NSString *getActivePageResult = [DokuUtils getValueFromNSUserDefaultForKey: activePageResult];
    
    [self.textFieldMerchantName setText: getMerchantName];
    [self.textFieldClientId setText: getClientId];
    [self.textFieldSharedkey setText: getSharedKey];
    [self.textFieldEnvironmentServer setText: getEnvironmentServer];
    [self.textFieldActiveResultPage setText: getActivePageResult];
    
    if (self.superview) {
        [self mas_makeConstraints: ^(MASConstraintMaker *make) {
            make.leading.equalTo(self.superview.mas_leading);
            make.top.equalTo(self.superview.mas_top);
            make.trailing.equalTo(self.superview.mas_trailing);
            make.bottom.equalTo(self.superview.mas_bottom);
        }];
    }
}

#pragma mark - DokuTextFieldDelegate

- (BOOL)dokuTextFieldShouldReturn: (UITextField *)textField {
    [textField resignFirstResponder];
    [self endEditing: YES];
    return YES;
}

- (BOOL)dokuTextFieldShouldBeginEditing: (UITextField *)textField {
    if (textField == self.textFieldEnvironmentServer) {
        [self endEditing:YES];
        [self selectEnvironmentServer];
        return NO;
    }

    if (textField == self.textFieldActiveResultPage) {
        [self endEditing:YES];
        [self selectActivePageResult];
        return NO;
    }

    return YES;
}

#pragma mark - Public method

- (void)show {
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    self.alpha = 0;
    [window addSubview: self];
    
    [UIView beginAnimations: nil
                    context: nil];
    
    self.alpha = .95;
    [UIView commitAnimations];
}

#pragma mark - Action

- (IBAction)buttonSubmit: (id)sender {
    [self buttonClose: sender];
}

- (IBAction)buttonClose: (id)sender {
    [UIView animateWithDuration: 0.25
                     animations: ^ {
        self.alpha = 0;
    } completion: ^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (void)selectEnvironmentServer{
    [ActionSheetStringPicker showPickerWithTitle: @"Environment Server"
                                            rows: self.environmentServer
                                initialSelection: self.selectedEnvironmentServerIndex
                                       doneBlock: ^(ActionSheetStringPicker *picker, NSInteger selectedIndex, id selectedValue) {
                                           self.textFieldEnvironmentServer.text = [NSString stringWithFormat:@"%@", selectedValue];
                                           self.selectedEnvironmentServerIndex = selectedIndex;
                                       }
                                     cancelBlock: nil
                                          origin: self];
}

- (void)selectActivePageResult{
    [ActionSheetStringPicker showPickerWithTitle: @"Active Page Result"
                                            rows: self.activePageResult
                                initialSelection: self.selectedActivePageResultIndex
                                       doneBlock: ^(ActionSheetStringPicker *picker, NSInteger selectedIndex, id selectedValue) {
                                           self.textFieldActiveResultPage.text = [NSString stringWithFormat:@"%@", selectedValue];
                                           self.selectedActivePageResultIndex = selectedIndex;
                                       }
                                     cancelBlock: nil
                                          origin: self];
}


@end
