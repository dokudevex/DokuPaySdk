//
//  Utils.h
//  DokuPayDemo
//
//  Created by Dedye on 26/06/20.
//  Copyright © 2020 Doku. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DokuUtils : NSObject

+ (NSString*)sha256HashFor:(NSString*)input;
+ (void)saveValueAtNSUserDefault:(NSString *)value forKey:(NSString *)key;
+ (id)getValueFromNSUserDefaultForKey:(NSString *)key;
+ (void)removeValueFromNSUserDefaultForKey:(NSString *)key;
+ (NSString *)getRandomInvoiceNumbertring:(NSInteger)length;

@end

NS_ASSUME_NONNULL_END
