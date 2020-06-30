//
//  DokuTextField.m
//  DokuPayDemo
//
//  Created by Dedye on 30/06/20.
//  Copyright © 2020 Doku. All rights reserved.
//

#import "DokuTextField.h"
#import "UIColor+DokuColor.h"
#import "UIFont+DokuFont.h"

@interface DokuTextField () <UITextFieldDelegate>

@property (assign, nonatomic) BOOL isLayoutSubviewsDone;

@end

@implementation DokuTextField

- (void)setShowPrototype:(BOOL)showPrototype {
    _showPrototype = showPrototype;

    if (showPrototype) {
        [self setupView];
    }
}

- (void)setPaddingRight:(NSInteger)paddingRight {
    _paddingRight = paddingRight;

    if (paddingRight) {
        UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(self.frame.size.width - paddingRight, 0, paddingRight, self.frame.size.height)];
        self.rightView = paddingView;
        self.rightViewMode = UITextFieldViewModeAlways;
    }
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];

    if (self) {
        [self setupView];
    }

    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];

    if (self) {
        [self setupView];
    }

    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];

    // Need to call again to use the real frame
    if (!self.isLayoutSubviewsDone) {
        // Setup underline here to prevent duplicate layers
        CALayer *borderLayer = [CALayer layer];
        borderLayer.frame = CGRectMake(0, self.frame.size.height - 1, self.frame.size.width, 1);
        borderLayer.backgroundColor = [UIColor dokuSeparator].CGColor;
        [self.layer addSublayer:borderLayer];
    }

    self.isLayoutSubviewsDone = YES;
}

- (void)setupView {
    // Setup floating text
    self.floatingLabelFont = [UIFont dokuRegularFontWithSize:12];
    self.floatingLabelActiveTextColor = [UIColor dokuPrimaryRed];
    self.floatingLabelTextColor = [UIColor dokuSecondaryText];
    self.placeholderYPadding = -4;
    self.keepBaseline = YES;

    // Setup default text field view
    self.textColor = [UIColor dokuBaseText];
    self.font = [UIFont dokuRegularFontWithSize:14];
    self.borderStyle = UITextBorderStyleNone;
    self.tintColor = [UIColor dokuPrimaryRed];
    self.delegate = self;
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    if (self.dokuTextFieldDelegate && [self.dokuTextFieldDelegate respondsToSelector:@selector(dokuTextFieldShouldBeginEditing:)]) {
        return [self.dokuTextFieldDelegate dokuTextFieldShouldBeginEditing:textField];
    }

    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    if (self.dokuTextFieldDelegate && [self.dokuTextFieldDelegate respondsToSelector:@selector(dokuTextFieldShouldEndEditing:)]) {
        return [self.dokuTextFieldDelegate dokuTextFieldShouldEndEditing:textField];
    }

    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    for (CALayer *layer in self.layer.sublayers) {
        if (layer.frame.size.height == 1) {
            layer.backgroundColor = [UIColor dokuPrimaryRed].CGColor;
            break;
        }
    }

    if (self.dokuTextFieldDelegate && [self.dokuTextFieldDelegate respondsToSelector:@selector(dokuTextFieldDidBeginEditing:)]) {
        [self.dokuTextFieldDelegate dokuTextFieldDidBeginEditing:textField];
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    for (CALayer *layer in self.layer.sublayers) {
        if (layer.frame.size.height == 1) {
            layer.backgroundColor = [UIColor dokuSeparator].CGColor;
            break;
        }
    }

    if (self.dokuTextFieldDelegate && [self.dokuTextFieldDelegate respondsToSelector:@selector(dokuTextFieldDidEndEditing:)]) {
        [self.dokuTextFieldDelegate dokuTextFieldDidEndEditing:textField];
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (self.dokuTextFieldDelegate && [self.dokuTextFieldDelegate respondsToSelector:@selector(dokuTextField:shouldChangeCharactersInRange:replacementString:)]) {
        return [self.dokuTextFieldDelegate dokuTextField:textField shouldChangeCharactersInRange:range replacementString:string];
    }

    return YES;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField {
    if (self.dokuTextFieldDelegate && [self.dokuTextFieldDelegate respondsToSelector:@selector(dokuTextFieldShouldClear:)]) {
        return [self.dokuTextFieldDelegate dokuTextFieldShouldClear:textField];
    }

    return NO;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (self.dokuTextFieldDelegate && [self.dokuTextFieldDelegate respondsToSelector:@selector(dokuTextFieldShouldReturn:)]) {
        return [self.dokuTextFieldDelegate dokuTextFieldShouldReturn:textField];
    }

    return NO;
}

@end
