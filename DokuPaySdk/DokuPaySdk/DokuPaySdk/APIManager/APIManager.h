//
//  APIManager.h
//  DokuPaySdk
//
//  Created by Dedye on 21/06/20.
//  Copyright © 2020 Doku. All rights reserved.
//

#import "AFNetworking.h"

NS_ASSUME_NONNULL_BEGIN

@interface APIManager : AFHTTPSessionManager

+ (instancetype)sharedManager;

@end

NS_ASSUME_NONNULL_END
