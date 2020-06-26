//
//  DokuPayUtils.m
//  DokuPaySdk
//
//  Created by Dedye on 22/06/20.
//  Copyright © 2020 Doku. All rights reserved.
//

#import "DokuPayUtils.h"
#import <UIKit/UIKit.h>

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

+(NSData *)nsStringToNsData:(NSString *)data {
    NSData *nsData = [data dataUsingEncoding:NSUTF8StringEncoding];
    return nsData;
}

+(NSData*)nsMutableDictionayToNsData:(NSMutableDictionary *)data {
    NSError *error;
    NSData *nsData = [NSJSONSerialization dataWithJSONObject:data
                        options:NSJSONWritingPrettyPrinted
                        error:&error];
    
    return nsData;
}

+(NSDictionary*)nsDataToDictionary:(NSData *)data {
   NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data
                                               options:NSJSONReadingMutableContainers
                                                 error:nil];
    return dict;
}

+ (UIImage*)getIcon:(NSString*)channelCode
{
    UIImage *image = nil;
    
    if ([channelCode isEqualToString:@"1"]) {
        image = [UIImage imageNamed:@"icon_mandiri" inBundle: [NSBundle bundleForClass:self.class]
        compatibleWithTraitCollection:nil];
    } else if ([channelCode isEqualToString:@"2"]) {
        image = [UIImage imageNamed:@"icon_mandiri_syariah" inBundle: [NSBundle bundleForClass:self.class]
        compatibleWithTraitCollection:nil];
    }
    return image;
}

+(UIAlertController*)alertView:(NSString *)message withTitle:(NSString *)title
{
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:title
                                          message:message
                                          preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction
                               actionWithTitle:NSLocalizedString(@"OK", @"OK action")
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction *action)
                               {
                                   [alertController dismissViewControllerAnimated:YES completion:nil];
                               }];
    
    
    [alertController addAction:okAction];
    
    return alertController;
}

@end
