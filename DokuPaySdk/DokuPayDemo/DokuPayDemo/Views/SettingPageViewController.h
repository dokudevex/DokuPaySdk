//
//  SettingPageViewViewController.h
//  DokuPayDemo
//
//  Created by Dedye on 26/06/20.
//  Copyright © 2020 Doku. All rights reserved.
//

#import "DokuView.h"
#import "DokuTextField.h"
#import "DokuAlertButton.h"

NS_ASSUME_NONNULL_BEGIN

@interface SettingPageViewController: DokuView <DokuTextFieldDelegate>

@property (weak, nonatomic) IBOutlet DokuAlertButton *buttonSubmit;
@property (weak, nonatomic) IBOutlet DokuTextField *textFieldMerchantName;
@property (weak, nonatomic) IBOutlet DokuTextField *textFieldClientId;
@property (weak, nonatomic) IBOutlet DokuTextField *textFieldSharedkey;
@property (weak, nonatomic) IBOutlet DokuTextField *textFieldEnvironmentServer;
@property (weak, nonatomic) IBOutlet DokuTextField *textFieldActiveResultPage;

@property (nonatomic, strong) NSArray *environmentServer;
@property (nonatomic, strong) NSArray *activePageResult;
@property (nonatomic, assign) NSInteger selectedEnvironmentServerIndex;
@property (nonatomic, assign) NSInteger selectedActivePageResultIndex;

- (void)show;

@end

NS_ASSUME_NONNULL_END
