//
//  SettingPageViewViewController.h
//  DokuPayDemo
//
//  Created by Dedye on 26/06/20.
//  Copyright © 2020 Doku. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SettingPageViewController: UIViewController <UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textFieldMerchantName;
@property (weak, nonatomic) IBOutlet UITextField *textFieldClientId;
@property (weak, nonatomic) IBOutlet UITextField *textFieldSharedkey;
@property (weak, nonatomic) IBOutlet UITextField *textFieldEnvironmentServer;
@property (weak, nonatomic) IBOutlet UITextField *textFieldActiveResultPage;
@property (weak, nonatomic) IBOutlet UIView *viewMain;

@property (nonatomic, strong) NSArray *environmentServer;
@property (nonatomic, strong) NSArray *activePageResult;
@property (nonatomic, assign) NSInteger selectedEnvironmentServerIndex;
@property (nonatomic, assign) NSInteger selectedActivePageResultIndex;

@end

NS_ASSUME_NONNULL_END
