//
//  DokuAlertButton.m
//  DokuPayDemo
//
//  Created by Dedye on 30/06/20.
//  Copyright © 2020 Doku. All rights reserved.
//

#import "DokuAlertButton.h"
#import "UIColor+DokuColor.h"

@implementation DokuAlertButton

- (void)setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];

    if (highlighted) {
        self.backgroundColor = [UIColor dokuGrayBackground];
    }
    else {
        self.backgroundColor = [UIColor clearColor];
    }
}

@end
