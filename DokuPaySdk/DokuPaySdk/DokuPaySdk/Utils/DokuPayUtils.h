//
//  DokuPayUtils.h
//  DokuPaySdk
//
//  Created by Dedye on 22/06/20.
//  Copyright © 2020 Doku. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MandiriVaParams.h"
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DokuPayUtils: NSObject

+(NSMutableDictionary*)createMandiriParams: (MandiriVaParams*)params;

+(NSData *)nsStringToNsData:(NSString *)data;

+(NSData *)nsMutableDictionayToNsData: (NSMutableDictionary *)data;

+(NSDictionary *)nsDataToDictionary: (NSData *)data;

+(UIImage*)getIcon: (NSString*)channelCode;

+(UIAlertController*)alertView: (NSString *)message
                     withTitle: (NSString *)title;


@end

NS_ASSUME_NONNULL_END
