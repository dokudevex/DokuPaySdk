//
//  DokuPaySdk.h
//  DokuPaySdk
//
//  Created by Dedye on 12/06/20.
//  Copyright © 2020 Doku. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol DokuPaySdkDelegate <NSObject>
- (void) sendStringBack: (NSString *_Nullable)data;
@end

typedef NS_ENUM(NSInteger, ChannelCode) {
    MandiriVa = 1,
    MandiriSyariahVa = 2
};

@interface DokuPaySdk: NSObject

@property (nullable, nonatomic) id<DokuPaySdkDelegate>delegate;

@property (strong, nonatomic) UIWindow *_Nonnull window;

- (void) connectVa: (id<DokuPaySdkDelegate>_Nonnull)session
    paymentChannel: (int)paymentChannel
          clientId: (NSString *_Nonnull)clientId
      merchantName: (NSString *_Nonnull)merchantName
     customerEmail: (NSString *_Nonnull)customerEmail
      customerName: (NSString *_Nonnull)customerName
        dataAmount: (NSString *_Nonnull)dataAmount
         dataWords: (NSString *_Nonnull)dataWords
       expiredTime: (NSString *_Nonnull)expiredTime
     invoiceNumber: (NSString *_Nonnull)invoiceNumber
      isProduction: (NSString *_Nonnull)isProduction
    reusableStatus: (NSString *_Nonnull)reusableStatus
     usePageResult: (NSString *_Nonnull)usePageResult;

+ (nonnull id)sharedInstance;

- (void)sendData: (nonnull NSString*)response;

@end

