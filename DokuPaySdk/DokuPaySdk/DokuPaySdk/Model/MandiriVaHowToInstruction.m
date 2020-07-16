//
//  MandiriVaHowToInstruction.m
//  DokuPaySdk
//
//  Created by Dedye on 25/06/20.
//  Copyright © 2020 Doku. All rights reserved.
//

#import "MandiriVaHowToInstruction.h"
#import "DokuPayUtils.h"

@implementation MandiriVaHowToInstruction

- (instancetype)initWithData:(NSString *)data {
    if (self = [super init]) {
        NSError *error;
        NSData *nsData = [data dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *jsonData = [NSJSONSerialization JSONObjectWithData: nsData
                                                                 options: kNilOptions
                                                                   error: &error];
        
        NSArray *fetchedData = [jsonData objectForKey:@"payment_instruction"];
        NSDictionary *virtual_account_info = [jsonData objectForKey:@"virtual_account_info"];
        
        self.expiredTime = [virtual_account_info objectForKey:@"expired_date"];
        self.howToPay = fetchedData;
    }
    return self;
}

@end
