//
//  ApiMandiriSyariahVa.h
//  DokuPaySdk
//
//  Created by Dedye on 21/06/20.
//  Copyright © 2020 Doku. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MandiriVaParams.h"

NS_ASSUME_NONNULL_BEGIN

@interface ApiMandiriSyariahVa: NSObject

+ (void)getPaymentCode: (MandiriVaParams *)params
                   url: (NSString *) url
             ifSucceed: (void (^)(NSString *response))succeed
              ifFailed: (void (^)(NSError *error))failed;

@end

NS_ASSUME_NONNULL_END
