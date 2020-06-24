//
//  ApiResultPage.m
//  DokuPaySdk
//
//  Created by Dedye on 22/06/20.
//  Copyright © 2020 Doku. All rights reserved.
//

#import "ApiResultPage.h"
#import <UIKit/UIKit.h>
#import "APIManager.h"
#import "DokuPayUtils.h"

@implementation ApiResultPage

+ (void)getHowToInstruction:(NSString *)url ifSucceed:(void (^)(NSString *))succeed ifFailed:(void (^)(NSError *))failed {
    
    APIManager *manager = [APIManager sharedManager];
    [manager GET:url parameters: nil headers: nil progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
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
