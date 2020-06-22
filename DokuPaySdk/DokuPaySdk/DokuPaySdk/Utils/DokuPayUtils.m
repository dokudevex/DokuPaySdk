//
//  DokuPayUtils.m
//  DokuPaySdk
//
//  Created by Dedye on 22/06/20.
//  Copyright © 2020 Doku. All rights reserved.
//

#import "DokuPayUtils.h"

@implementation DokuPayUtils

+(NSMutableDictionary*)createMandiriParams:(MandiriVaParams*)params {
    
    NSMutableDictionary *object = [NSMutableDictionary dictionary];
    NSMutableDictionary *client = [NSMutableDictionary dictionary];
    client[@"id"] = params.clientId;
    object[@"client"] = client;
    
    NSMutableDictionary *order = [NSMutableDictionary dictionary];
    order[@"invoice_number"] = params.invoiceNumber;
    order[@"amount"] = params.amount;
    object[@"order"] = order;
    
    NSMutableDictionary *virtual_account_info = [NSMutableDictionary dictionary];
    virtual_account_info[@"expired_time"] = params.expiredTime;
    virtual_account_info[@"reusable_status"] = params.reusableStatus;
    object[@"virtual_account_info"] = virtual_account_info;
    
    NSMutableDictionary *customer = [NSMutableDictionary dictionary];
    customer[@"name"] = params.name;
    customer[@"email"] = params.email;
    object[@"customer"] = customer;
    
    NSMutableDictionary *security = [NSMutableDictionary dictionary];
    security[@"check_sum"] = params.checkSum;
    object[@"security"] = security;
    
    return object;
}

@end
