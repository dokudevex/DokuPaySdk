//
//  DokuStyle.m
//  DokuPayDemo
//
//  Created by Dedye on 11/07/20.
//  Copyright © 2020 Doku. All rights reserved.
//

#import "DokuStyle.h"
#import "UIFont+DokuFont.h"
#import "UIColor+DokuColor.h"
#import <QuartzCore/QuartzCore.h>

@implementation DokuStyle

+ (UITextField*)dokuTextField: (UITextField*)dokuTextField {
    dokuTextField.textColor = [UIColor dokuBaseText];
    dokuTextField.font = [UIFont dokuDINNextLTProRegularFontWithSize: 14];
    dokuTextField.borderStyle = UITextBorderStyleNone;
    dokuTextField.tintColor = [UIColor dokuPrimaryRed];
       
    CALayer *borderLayer = [CALayer layer];
    borderLayer.frame = CGRectMake(0, dokuTextField.frame.size.height - 1, dokuTextField.frame.size.width, 1);
    borderLayer.backgroundColor = [UIColor dokuSeparator].CGColor;
    [dokuTextField.layer addSublayer: borderLayer];
    
    return dokuTextField;
}

+ (UIView *)DokuViewRoundedTopLeftRight: (UIView *)DokuViewRoundedTopLeftRight {
    CAShapeLayer * maskLayerView = [CAShapeLayer layer];
    maskLayerView.path = [UIBezierPath bezierPathWithRoundedRect: DokuViewRoundedTopLeftRight.bounds
                                               byRoundingCorners: UIRectCornerTopLeft | UIRectCornerTopRight
                                                     cornerRadii: (CGSize){10.0, 10.}].CGPath;
    DokuViewRoundedTopLeftRight.layer.mask = maskLayerView;
    return DokuViewRoundedTopLeftRight;
}

+ (UIButton *)DokuButonRoundedTopLeftRight: (UIButton *)DokuButonRoundedTopLeftRight {
    CAShapeLayer * maskLayerView = [CAShapeLayer layer];
    maskLayerView.path = [UIBezierPath bezierPathWithRoundedRect: DokuButonRoundedTopLeftRight.bounds
                                               byRoundingCorners: UIRectCornerBottomLeft | UIRectCornerBottomRight
                                                     cornerRadii: (CGSize){10.0, 10.}].CGPath;
    
    DokuButonRoundedTopLeftRight.layer.mask = maskLayerView;
    return DokuButonRoundedTopLeftRight;
}

@end
