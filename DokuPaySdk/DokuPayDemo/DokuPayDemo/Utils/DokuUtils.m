//
//  Utils.m
//  DokuPayDemo
//
//  Created by Dedye on 26/06/20.
//  Copyright © 2020 Doku. All rights reserved.
//

#import "DokuUtils.h"
#import <CommonCrypto/CommonDigest.h>
#import <UIKit/UIKit.h>

@implementation DokuUtils

+ (NSString *) sha256HashFor: (NSString *)input {
    const char* str = [input UTF8String];
    unsigned char result[CC_SHA256_DIGEST_LENGTH];
    CC_SHA256(str, (CC_LONG)strlen(str), result);
    
    NSMutableString *ret = [NSMutableString stringWithCapacity: CC_SHA256_DIGEST_LENGTH*2];
    for(int i = 0; i<CC_SHA256_DIGEST_LENGTH; i++)
    {
        [ret appendFormat:@"%02x",result[i]];
    }
    return ret;
}

+ (void) saveValueAtNSUserDefault: (NSString *)value forKey: (NSString *)key {
    [[NSUserDefaults standardUserDefaults] setValue: value forKey: key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (id) getValueFromNSUserDefaultForKey: (NSString *)key {
    return [[NSUserDefaults standardUserDefaults] valueForKey: key];
}

+ (void) removeValueFromNSUserDefaultForKey: (NSString *)key {
    [[NSUserDefaults standardUserDefaults] removeObjectForKey: key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSString *) getRandomInvoiceNumbertring: (NSInteger)length {
    NSMutableString *returnString = [NSMutableString stringWithCapacity: length];

    NSString *numbers = @"0123456789";

    [returnString appendFormat: @"%C", [numbers characterAtIndex:(arc4random() % ([numbers length]-1))+1]];

    for (int i = 1; i < length; i++)
    {
        [returnString appendFormat: @"%C", [numbers characterAtIndex: arc4random() % [numbers length]]];
    }

    return returnString;
}

+ (NSDictionary*)nsDataToDictionary: (NSData *)data {
   NSDictionary *dict = [NSJSONSerialization JSONObjectWithData: data
                                                        options: NSJSONReadingMutableContainers
                                                          error: nil];
    return dict;
}

+ (UIImage*)getIcon: (NSString *)channelCode {
    UIImage *image = nil;
    
    if ([channelCode isEqualToString: @"1"]) {
        image = [UIImage imageNamed: @"icon_mandiri"
                           inBundle: [NSBundle bundleForClass:self.class]
        compatibleWithTraitCollection: nil];
    } else if ([channelCode isEqualToString: @"2"]) {
        image = [UIImage imageNamed: @"icon_mandiri_syariah"
                           inBundle: [NSBundle bundleForClass:self.class]
        compatibleWithTraitCollection: nil];
    }
    return image;
}

+ (NSDate *) stringDateToDate: (NSString *)date dateFormat: (NSString *)dateFormat {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat: dateFormat];
    NSDate *newDate = [dateFormatter dateFromString: date];
    return newDate;
}

+ (NSString *)formatDatetoString: (NSDate *)date dateFormat: (NSString *)dateFormat {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat: dateFormat];
    NSString *newFormatDate = [dateFormatter stringFromDate: date];
    return newFormatDate;
}

@end
