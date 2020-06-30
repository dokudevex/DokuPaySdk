//
//  UIFont+DokuFont.m
//  DokuPayDemo
//
//  Created by Dedye on 30/06/20.
//  Copyright © 2020 Doku. All rights reserved.
//

#import "UIFont+DokuFont.h"

@implementation UIFont (DokuFont)

+ (UIFont *)dokuLightFontWithSize:(CGFloat)size {
    return [UIFont fontWithName:@"DIN-Light" size:size];
}

+ (UIFont *)dokuRegularFontWithSize:(CGFloat)size {
    return [UIFont fontWithName:@"DINNextLTPro-Regular" size:size];
}

@end
