//
//  DokuTextField.h
//  DokuPayDemo
//
//  Created by Dedye on 30/06/20.
//  Copyright © 2020 Doku. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JVFloatLabeledTextField.h"

@protocol DokuTextFieldDelegate <NSObject>

@optional

- (BOOL)dokuTextFieldShouldBeginEditing: (UITextField *)textField;
- (void)dokuTextFieldDidBeginEditing: (UITextField *)textField;
- (BOOL)dokuTextFieldShouldEndEditing: (UITextField *)textField;
- (void)dokuTextFieldDidEndEditing: (UITextField *)textField;
- (BOOL)dokuTextField: (UITextField *)textField
shouldChangeCharactersInRange : (NSRange)range
    replacementString: (NSString *)string;
- (BOOL)dokuTextFieldShouldClear: (UITextField *)textField;
- (BOOL)dokuTextFieldShouldReturn: (UITextField *)textField;

@end

IB_DESIGNABLE

@interface DokuTextField: JVFloatLabeledTextField

@property (assign, nonatomic) IBInspectable BOOL showPrototype;
@property (assign, nonatomic) IBInspectable NSInteger paddingRight;

@property (weak, nonatomic) id<DokuTextFieldDelegate> dokuTextFieldDelegate;

@end
