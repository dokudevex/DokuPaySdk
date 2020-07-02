//
//  ApiMandiriVa.m
//  DokuPaySdk
//
//  Created by Dedye on 21/06/20.
//  Copyright © 2020 Doku. All rights reserved.
//

#import "ApiMandiriVa.h"
#import <UIKit/UIKit.h>
#import "APIManager.h"
#import "DokuPayUtils.h"

@implementation ApiMandiriVa

+ (void)getPaymentCode: (MandiriVaParams *)params
                   url: (NSString *) url
             ifSucceed: (void (^)(NSString *))succeed
              ifFailed: (void (^)(NSError *))failed {
    
    APIManager *manager = [APIManager sharedManager];
    
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];

    [manager.requestSerializer setValue: @"application/json"
                     forHTTPHeaderField: @"Accept" ];
    
    [manager.requestSerializer setValue: @"application/json; charset=utf-8"
                     forHTTPHeaderField: @"Content-Type" ];
    
    NSData *jsonDataParam = [DokuPayUtils nsMutableDictionayToNsData: [DokuPayUtils createMandiriParams:params]];
    NSString * data = [[NSString alloc] initWithData: jsonDataParam
                                            encoding: NSUTF8StringEncoding];
    NSDictionary *dict = [DokuPayUtils nsDataToDictionary: jsonDataParam];
    NSLog(@"params json Mandiri Va %@",data);

    [manager POST: url
       parameters: dict
          headers: nil
         progress: nil
          success: ^(NSURLSessionDataTask *task, id responseObject) {
        
        NSMutableDictionary *response = [[NSMutableDictionary alloc] initWithDictionary:responseObject];
        NSData *jsonDataResponse = [DokuPayUtils nsMutableDictionayToNsData: response];
        NSString *data = [[NSString alloc] initWithData: jsonDataResponse
                                               encoding: NSUTF8StringEncoding];
        if (succeed) {
            succeed(data);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (failed) {
            failed(error);
        }
    }];
}

@end
