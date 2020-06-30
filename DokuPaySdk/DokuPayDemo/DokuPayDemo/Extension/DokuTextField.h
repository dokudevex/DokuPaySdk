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

- (BOOL)dokuTextFieldShouldBeginEditing:(UITextField *)textField;        // return NO to disallow editing.
- (void)dokuTextFieldDidBeginEditing:(UITextField *)textField;           // became first responder
- (BOOL)dokuTextFieldShouldEndEditing:(UITextField *)textField;          // return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end
- (void)dokuTextFieldDidEndEditing:(UITextField *)textField;             // may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called

- (BOOL)dokuTextField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;   // return NO to not change text

- (BOOL)dokuTextFieldShouldClear:(UITextField *)textField;               // called when clear button pressed. return NO to ignore (no notifications)
- (BOOL)dokuTextFieldShouldReturn:(UITextField *)textField;              // called when 'return' key pressed. return NO to ignore.

@end

IB_DESIGNABLE

@interface DokuTextField : JVFloatLabeledTextField

@property (assign, nonatomic) IBInspectable BOOL showPrototype;
@property (assign, nonatomic) IBInspectable NSInteger paddingRight;

@property (weak, nonatomic) id<DokuTextFieldDelegate> dokuTextFieldDelegate;

@end
