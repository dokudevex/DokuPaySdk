//
//  SettingPageViewViewController.m
//  DokuPayDemo
//
//  Created by Dedye on 26/06/20.
//  Copyright © 2020 Doku. All rights reserved.
//

#import "SettingPageViewController.h"
#import "DokuUtils.h"
#import "DokuConstants.h"
#import "STPopup.h"
#import "DokuStyle.h"
#import "UIColor+DokuColor.h"

@interface SettingPageViewController ()

@property (nonatomic) UIPickerView *pickerViewEnvironment;
@property (nonatomic) UIPickerView *pickerViewPage;
@property (nonatomic, assign) NSInteger selectedEnvironmentIndex;
@property (nonatomic, assign) NSInteger selectedPageResultIndex;

@end

@implementation SettingPageViewController


#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.selectedEnvironmentIndex = 0;
    
    self.selectedPageResultIndex = 0;

    self.environmentServer = @[@"SandBox",
                               @"Production"];
    
    self.activePageResult = @[@"YES",
                              @"NO"];
    
    self.contentSizeInPopup = CGSizeMake(360, 460);
    self.landscapeContentSizeInPopup = CGSizeMake(500, 500);
    
    self.textFieldEnvironmentServer.delegate = self;
    self.textFieldActiveResultPage.delegate = self;
    
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
    
    [DokuStyle dokuTextField: self.textFieldMerchantName];
    [DokuStyle dokuTextField: self.textFieldClientId];
    [DokuStyle dokuTextField: self.textFieldSharedkey];
    [DokuStyle dokuTextField: self.textFieldEnvironmentServer];
    [DokuStyle dokuTextField: self.textFieldActiveResultPage];
    
    [self initPickers];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    if (textField == self.textFieldEnvironmentServer) {
        [self.view endEditing:YES];
        [self setdataEnvironmentPicker: textField];
    } else if (textField == self.textFieldActiveResultPage) {
        [self.view endEditing:YES];
        [self setdataPageResultPicker: textField];
    }
    
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    [self.view endEditing:YES];
    return YES;
}

- (void) setdataPageResultPicker: (UITextField *)textField {
    if ([textField.text isEqualToString: @"YES"]) {
        self.selectedPageResultIndex = 0;
    } else if ([textField.text isEqualToString: @"NO"]) {
        self.selectedPageResultIndex = 1;
    }
    
    [self.pickerViewPage selectRow: self.selectedPageResultIndex
                       inComponent: 0
                          animated: YES];
}

- (void) setdataEnvironmentPicker: (UITextField *)textField {
    if ([textField.text isEqualToString: @"SandBox"]) {
        self.selectedEnvironmentIndex = 0;
    } else if ([textField.text isEqualToString: @"Production"]) {
        self.selectedEnvironmentIndex = 1;
    }
    
    [self.pickerViewEnvironment selectRow: self.selectedEnvironmentIndex
                              inComponent: 0
                                 animated: YES];
}

- (void) initPickers {
    UIToolbar * toolbar = [[UIToolbar alloc] init];
    toolbar.barStyle = UIBarStyleDefault;
    toolbar.translucent = true;
    toolbar.tintColor = [UIColor dokuBaseText];
    [toolbar sizeToFit];
    [toolbar setUserInteractionEnabled: true];
    
    UIBarButtonItem *done = [[UIBarButtonItem alloc] initWithTitle: @"Done"
                                                             style: UIBarButtonItemStylePlain
                                                            target: self
                                                            action: @selector(donePicker:)];
    
    UIBarButtonItem *fixedSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemFlexibleSpace
                                                                                target: nil
                                                                                action: nil];
    
    UIBarButtonItem *cancel = [[UIBarButtonItem alloc] initWithTitle: @"Cancel"
                                                             style: UIBarButtonItemStylePlain
                                                            target: self
                                                            action: @selector(donePicker:)];
    
    NSArray *items = [NSArray arrayWithObjects: done, fixedSpace, cancel, nil];
    [toolbar setItems: items];
    
    self.pickerViewEnvironment = [[UIPickerView alloc] init];
    self.pickerViewEnvironment.dataSource = self;
    self.pickerViewEnvironment.delegate = self;
    self.pickerViewEnvironment.showsSelectionIndicator = true;

    self.textFieldEnvironmentServer.inputView = self.pickerViewEnvironment;
    self.textFieldEnvironmentServer.inputAccessoryView = toolbar;
    
    self.pickerViewPage = [[UIPickerView alloc] init];
    self.pickerViewPage.dataSource = self;
    self.pickerViewPage.delegate = self;
    self.pickerViewPage.showsSelectionIndicator = true;

    self.textFieldActiveResultPage.inputView = self.pickerViewPage;
    self.textFieldActiveResultPage.inputAccessoryView = toolbar;

}

- (IBAction)donePicker: (id)sender {
    [self.viewMain endEditing:true];
}

#pragma mark - Action

- (IBAction)buttonSubmit: (id)sender {
    
    NSString *dataClientId = self.textFieldClientId.text;
    NSString *dataMerchantName = self.textFieldMerchantName.text;
    NSString *dataSharedKey = self.textFieldSharedkey.text;
    NSString *dataEnvironmentServer = self.textFieldEnvironmentServer.text;
    NSString *dataActivePageResult = self.textFieldActiveResultPage.text;
    
    [DokuUtils saveValueAtNSUserDefault: dataClientId forKey: clientId];
    [DokuUtils saveValueAtNSUserDefault: dataMerchantName forKey: merchantName];
    [DokuUtils saveValueAtNSUserDefault: dataSharedKey forKey: sharedKey];
    [DokuUtils saveValueAtNSUserDefault: dataEnvironmentServer forKey: environmentServer];
    [DokuUtils saveValueAtNSUserDefault: dataActivePageResult forKey: activePageResult];
    
   [self dismissViewControllerAnimated: YES
                            completion: nil];
}

- (IBAction)buttonClose:(id)sender {
    [self dismissViewControllerAnimated: YES
                             completion: nil];
}

#pragma mark - Picker View

- (NSInteger)numberOfComponentsInPickerView: (UIPickerView *)pickerView {
    return 1;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow: (NSInteger)row
      inComponent:(NSInteger)component {
        if (pickerView == self.pickerViewEnvironment) {
            self.textFieldEnvironmentServer.text = self.environmentServer[row];
            self.selectedEnvironmentIndex = row;
        } else if (pickerView == self.pickerViewPage) {
            self.textFieldActiveResultPage.text = self.activePageResult[row];
            self.selectedPageResultIndex = row;
        }
}

- (NSInteger)pickerView: (UIPickerView *)pickerView
numberOfRowsInComponent: (NSInteger)component {
    NSInteger dataCount;
    dataCount = 0;
    if (pickerView == self.pickerViewEnvironment) {
        dataCount = self.environmentServer.count;
    } else if (pickerView == self.pickerViewPage) {
        dataCount = self.activePageResult.count;
    }
    return dataCount;
}

- (NSString*)pickerView: (UIPickerView *)pickerView
            titleForRow: (NSInteger)row
           forComponent: (NSInteger)component
{
    NSString *data;
    if (pickerView == self.pickerViewEnvironment) {
        data = self.environmentServer[row];
    } else if (pickerView == self.pickerViewPage) {
        data = self.activePageResult[row];
    }
    return data;
}

@end
