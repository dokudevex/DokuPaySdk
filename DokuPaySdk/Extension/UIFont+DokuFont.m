//
//  UIFont+DokuFont.m
//  DokuPayDemo
//
//  Created by Dedye on 30/06/20.
//  Copyright © 2020 Doku. All rights reserved.
//

#import "UIFont+DokuFont.h"

@implementation UIFont (DokuFont)

+ (UIFont *)dokuDINNextLTProMediumFontWithSize: (CGFloat)size {
    return [UIFont fontWithName: @"DINNextLTPro-Medium"
                           size: size];
}

+ (UIFont *)dokuDINNextLTProRegularFontWithSize: (CGFloat)size {
    return [UIFont fontWithName: @"DINNextLTPro-Regular"
                           size: size];
}

+ (UIFont *)dokuDINNextLTProBoldFontWithSize: (CGFloat)size {
    return [UIFont fontWithName: @"DINNextLTPro-Bold"
                           size: size];
}

+ (UIFont *)dokuRobotoBoldFontWithSize: (CGFloat)size {
    return [UIFont fontWithName: @"Roboto-Bold"
                           size: size];
}


@end
