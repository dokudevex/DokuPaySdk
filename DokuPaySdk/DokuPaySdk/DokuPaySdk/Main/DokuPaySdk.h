//
//  DokuPaySdk.h
//  DokuPaySdk
//
//  Created by Dedye on 12/06/20.
//  Copyright © 2020 Doku. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol DokuPaySdk <NSObject>
@end

typedef NS_ENUM(NSInteger, ChannelCode) {
    MandiriVa = 1,
    MandiriSyariahVa = 2
};

@interface DokuPaySdk : NSObject

@property (strong, nonatomic) UIWindow * _Nonnull window;

- (void) connect:(int)channelCode;

+ (nonnull id)sharedInstance;

@end

