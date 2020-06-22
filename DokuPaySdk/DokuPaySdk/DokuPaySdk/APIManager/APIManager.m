//
//  APIManager.m
//  DokuPaySdk
//
//  Created by Dedye on 21/06/20.
//  Copyright © 2020 Doku. All rights reserved.
//

#import "APIManager.h"
#import <APIConstant.h>

@implementation APIManager

+ (instancetype)sharedManager {
    static APIManager *sharedManagerSingleton = nil;
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
        sharedManagerSingleton = [[APIManager alloc] initWithBaseURL:[NSURL URLWithString:ApiBaseUrl]];
        [sharedManagerSingleton.requestSerializer setValue:@"Lang" forHTTPHeaderField:@"Accept-Language"];
        sharedManagerSingleton.requestSerializer.timeoutInterval = 60 * 2; //2 menit
    });

    return sharedManagerSingleton;
}

@end
