//
//  ApiMandiriSyariahVa.m
//  DokuPaySdk
//
//  Created by Dedye on 21/06/20.
//  Copyright © 2020 Doku. All rights reserved.
//

#import "ApiMandiriSyariahVa.h"
#import <UIKit/UIKit.h>
#import "APIManager.h"
#import "DokuPayUtils.h"

@implementation ApiMandiriSyariahVa

+ (void)getPaymentCode:(MandiriVaParams *)params ifSucceed:(void (^)(NSString *))succeed ifFailed:(void (^)(NSError *))failed {
    
    NSError *error = nil;
    
    APIManager *manager = [APIManager sharedManager];
    
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];

    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept" ];
    [manager.requestSerializer setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type" ];

    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:[DokuPayUtils createMandiriParams:params] options:NSJSONWritingPrettyPrinted error:&error];
    
    NSString * data = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    NSLog(@"params json Info %@",data);
    
    NSDictionary *dict = (NSDictionary *)[NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:&error];

    [manager POST:@"bsm-virtual-account/v1/payment-code" parameters:dict headers: nil progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSError *error;
        NSMutableDictionary *response = [[NSMutableDictionary alloc] initWithDictionary:responseObject];
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:response
                                                           options:NSJSONWritingPrettyPrinted
                                                             error:&error];
        NSString *data = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
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
