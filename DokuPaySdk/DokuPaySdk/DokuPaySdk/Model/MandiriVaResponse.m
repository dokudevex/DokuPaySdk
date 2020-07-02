//
//  MandiriVaResponse.m
//  DokuPaySdk
//
//  Created by Dedye on 24/06/20.
//  Copyright © 2020 Doku. All rights reserved.
//

#import "MandiriVaResponse.h"
#import "DokuPayUtils.h"

@implementation MandiriVaResponse

- (instancetype)initWithData: (NSString *)data
                      amount: (NSString *)amount
                   channelId: (NSString *)channelId
                isProduction: (NSString *)isProduction
                merchantName: (NSString *)merchantName {
    
    if (self = [super init]) {
        NSData *nsData = [data dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary* dictionary = [DokuPayUtils nsDataToDictionary: nsData];
        
        NSDictionary *order = [dictionary objectForKey:@"order"];
        NSDictionary *client = [dictionary objectForKey:@"client"];
        NSDictionary *virtual_account_info = [dictionary objectForKey:@"virtual_account_info"];
        
        self.clientId = [client objectForKey:@"id"];
        self.invoiceNumber = [order objectForKey:@"invoice_number"];
        self.vaNumber = [virtual_account_info objectForKey:@"virtual_account_number"];
        self.createdDate = [virtual_account_info objectForKey:@"created_date"];
        self.howToPayApi = [virtual_account_info objectForKey:@"how_to_pay_api"];
        self.howToPayPage = [virtual_account_info objectForKey:@"how_to_pay_page"];
        self.ExpiredDate = [virtual_account_info objectForKey:@"expired_date"];
        self.amount = amount;
        self.channelId = channelId;
        self.isProduction = isProduction;
        self.merchantName = merchantName;
    }
    return self;
}
@end
