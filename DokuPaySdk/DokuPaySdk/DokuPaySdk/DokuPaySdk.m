//
//  DokuPaySdk.m
//  DokuPaySdk
//
//  Created by Dedye on 15/06/20.
//  Copyright © 2020 Doku. All rights reserved.
//

#import "DokuPaySdk.h"
#import "MandiriVaRouter.h"

static DokuPaySdk *sharedInstance = nil;
@implementation DokuPaySdk

-(void)connectSdk {  
    UIViewController * viewController =  [MandiriVaRouter createModule];
    [(UIViewController*)self.delegate presentViewController: viewController animated:YES completion: nil];
    NSLog(@"Dedye Open VC");
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
