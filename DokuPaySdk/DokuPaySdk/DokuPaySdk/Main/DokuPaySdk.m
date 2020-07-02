//
//  DokuPaySdk.m
//  DokuPaySdk
//
//  Created by Dedye on 15/06/20.
//  Copyright © 2020 Doku. All rights reserved.
//

#import "DokuPaySdk.h"
#import "MandiriVaRouter.h"
#import "MandiriVaViewController.h"
#import "MandiriSyariahVaViewController.h"
#import "MandiriSyariahVaRouter.h"
#import "MandiriVaParams.h"

static DokuPaySdk *sharedInstance = nil;
@implementation DokuPaySdk

-(void) connectVa: (id<DokuPaySdkDelegate>_Nonnull)session
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
    usePageResult: (NSString *_Nonnull)usePageResult {
    
    MandiriVaParams * mandiriVaParams = [[MandiriVaParams alloc] initWithText: clientId
                                                                 merchantName: merchantName
                                                                    channelId: [NSString stringWithFormat:@"%i", paymentChannel]
                                                                 isProduction: isProduction
                                                                       amount: dataAmount
                                                                invoiceNumber: invoiceNumber
                                                               reusableStatus: reusableStatus
                                                                  expiredTime: expiredTime
                                                                        info1: @""
                                                                        info2: @""
                                                                        info3: @""
                                                                        email: customerEmail
                                                                         name: customerName
                                                                     checkSum: dataWords
                                                                usePageResult: usePageResult];
    
    self.delegate = session;
    
    if (paymentChannel == MandiriVa) {
        [self createViewMandiriVa: mandiriVaParams];
    } else if (paymentChannel == MandiriSyariahVa) {
        [self createViewMandiriSyariahVa: mandiriVaParams];
    }
}

- (void)createViewMandiriVa: (MandiriVaParams *)data {
    MandiriVaViewController *todoViewController = (MandiriVaViewController *) [MandiriVaRouter createModule: data];
    [(UIViewController*)self.delegate presentViewController: todoViewController
                                                   animated: YES
                                                 completion: nil];
}

- (void)createViewMandiriSyariahVa:  (MandiriVaParams *)data {
    MandiriSyariahVaViewController *todoViewController = (MandiriSyariahVaViewController *) [MandiriSyariahVaRouter createModule: data];
    [(UIViewController*)self.delegate presentViewController: todoViewController
                                                   animated: YES
                                                 completion: nil];
}

+ (void) setSharedInstance: (DokuPaySdk *)instance
{
    sharedInstance = instance;
}

+(DokuPaySdk *)sharedInstance
{
    static DokuPaySdk *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

-(void)sendData:(nonnull NSString*)response {
    if ([self.delegate respondsToSelector: @selector(sendStringBack:)])
    {
        [self.delegate sendStringBack: response];
    }
}


@end
