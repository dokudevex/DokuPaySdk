//
//  MandiriVaParams.h
//  DokuPaySdk
//
//  Created by Dedye on 21/06/20.
//  Copyright © 2020 Doku. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MandiriVaParams : NSObject

@property (nonatomic) NSString *clientId;
@property (nonatomic) NSString *amount;
@property (nonatomic) NSString *invoiceNumber;
@property (nonatomic) NSString *reusableStatus;
@property (nonatomic) NSString *expiredTime;
@property (nonatomic) NSString *info1;
@property (nonatomic) NSString *info2;
@property (nonatomic) NSString *info3;
@property (nonatomic) NSString *email;
@property (nonatomic) NSString *name;
@property (nonatomic) NSString *checkSum;

- (instancetype)initWithText:(NSString *)clientId amount:(NSString *)amount invoiceNumber:(NSString *)invoiceNumber reusableStatus:(NSString *)reusableStatus expiredTime:(NSString *)expiredTime info1:(NSString *)info1 info2:(NSString *)info2 info3:(NSString *)info3 email:(NSString *)email name:(NSString *)name checkSum:(NSString *)checkSum;

@end

NS_ASSUME_NONNULL_END
