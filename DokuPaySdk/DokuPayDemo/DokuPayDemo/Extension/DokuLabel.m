//
//  DokuLabel.m
//  DokuPayDemo
//
//  Created by Dedye on 30/06/20.
//  Copyright © 2020 Doku. All rights reserved.
//

#import "DokuLabel.h"

@implementation DokuLabel

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

- (void)setupView {
    [self setText:self.text];
}

- (void)setText:(NSString *)text {
    [super setText:text];

    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 4;
    paragraphStyle.alignment = self.textAlignment;

    if (self.text) {
        NSAttributedString *attributedString = [[NSAttributedString alloc] initWithString:self.text attributes:@{NSParagraphStyleAttributeName:paragraphStyle}];

        self.attributedText = attributedString;
    }
}

@end
