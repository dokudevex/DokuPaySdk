//
//  DokuView.m
//  DokuPayDemo
//
//  Created by Dedye on 30/06/20.
//  Copyright © 2020 Doku. All rights reserved.
//

#import "DokuView.h"
#import "DokuTextField.h"

@interface DokuView ()

@property (strong, nonatomic) DokuTextField *activeTextField;

@end

@implementation DokuView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];

    if (self) {
        [self xibSetup];
    }

    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];

    if (self) {
        [self xibSetup];
    }
    
    return self;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)xibSetup {
    UIView *view = [[[UINib nibWithNibName:NSStringFromClass([self class]) bundle:[NSBundle bundleForClass:self.class]] instantiateWithOwner:self options:nil] firstObject];
    [self addSubview:view];
    view.frame = self.bounds;

    // Setup dismiss keyboard by tapping empty place
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    tapRecognizer.cancelsTouchesInView = NO;
    [self addGestureRecognizer:tapRecognizer];

    // Setup keyboard notification
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrameNotification:) name:UIKeyboardWillChangeFrameNotification object:nil];
}

- (void)dismissKeyboard {
    [self endEditing:YES];
}

#pragma mark - DokuTextFieldDelegate

- (void)dokuTextFieldDidBeginEditing:(DokuTextField *)textField {
    self.activeTextField = textField;
}

- (void)dokuTextFieldDidEndEditing:(DokuTextField *)textField {
    self.activeTextField = nil;
}

#pragma mark - Notification

- (void)keyboardWillChangeFrameNotification:(NSNotification *)notification {
    CGRect keyboardFrame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];

    if ([self respondsToSelector:NSSelectorFromString(@"scrollView")]) {
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        UIScrollView *scrollView = [self valueForKey:@"scrollView"];
        CGFloat keyboardRealHeightOnScreen = CGRectGetHeight(window.frame) - CGRectGetMinY(keyboardFrame);

        UIView *accessoryView = self.activeTextField.inputAccessoryView;
        CGFloat accessoryViewHeight = 0;

        if (accessoryView && keyboardRealHeightOnScreen) {
            accessoryViewHeight = CGRectGetHeight(accessoryView.frame);
        }

        scrollView.contentInset = UIEdgeInsetsMake(0, 0, keyboardRealHeightOnScreen - accessoryViewHeight, 0);
    }

    [self setNeedsLayout];
    [self layoutIfNeeded];
}

@end
