//
//  Utils.m
//  DokuPayDemo
//
//  Created by Dedye on 26/06/20.
//  Copyright © 2020 Doku. All rights reserved.
//

#import "Utils.h"
#import <CommonCrypto/CommonDigest.h>

@implementation Utils

-(NSString*)sha256HashFor:(NSString*)input
{
    const char* str = [input UTF8String];
    unsigned char result[CC_SHA256_DIGEST_LENGTH];
    CC_SHA256(str, (CC_LONG)strlen(str), result);
    
    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_SHA256_DIGEST_LENGTH*2];
    for(int i = 0; i<CC_SHA256_DIGEST_LENGTH; i++)
    {
        [ret appendFormat:@"%02x",result[i]];
    }
    return ret;
}

@end
