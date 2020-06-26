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

static DokuPaySdk *sharedInstance = nil;
@implementation DokuPaySdk

-(void) connectVa:(int)paymentChannel
     merchantName:(NSString *_Nonnull)merchantName
    customerEmail:(NSString *_Nonnull)customerEmail
     customerName:(NSString *_Nonnull)customerName
       dataAmount:(NSString *_Nonnull)dataAmount
        dataWords:(NSString *_Nonnull)dataWords
      expiredTime:(NSString *_Nonnull)expiredTime
    invoiceNumber:(NSString *_Nonnull)invoiceNumber
     isProduction:(NSString *_Nonnull)isProduction
   reusableStatus:(NSString *_Nonnull)reusableStatus
    usePageResult:(NSString *_Nonnull)usePageResult {
    
    if (paymentChannel == MandiriVa) {
        [self createViewMandiriVa];
    } else if (paymentChannel == MandiriSyariahVa) {
        [self createViewMandiriSyariahVa];
    }
}

- (void)createViewMandiriVa {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    MandiriVaViewController *todoViewController = (MandiriVaViewController *) [MandiriVaRouter createModule];
    //UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:todoViewController];
    self.window.rootViewController = todoViewController;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
}

- (void)createViewMandiriSyariahVa {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    MandiriSyariahVaViewController *todoViewController = (MandiriSyariahVaViewController *) [MandiriSyariahVaRouter createModule];
    //UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:todoViewController];
    self.window.rootViewController = todoViewController;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
}

+ (void) setSharedInstance:(DokuPaySdk *)instance
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

@end
