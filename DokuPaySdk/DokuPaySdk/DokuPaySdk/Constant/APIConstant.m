//
//  APIConstant.m
//  DokuPaySdk
//
//  Created by Dedye on 21/06/20.
//  Copyright © 2020 Doku. All rights reserved.
//

#import "APIConstant.h"

#ifdef DEBUG
    NSString * const ApiBaseUrl = @"http://dev.dokupay.com/";
#else
    NSString * const ApiBaseUrl = @"https://dokupay.com/";
#endif
