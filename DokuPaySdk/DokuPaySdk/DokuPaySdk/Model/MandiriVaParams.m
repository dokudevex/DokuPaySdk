//
//  MandiriVaParams.m
//  DokuPaySdk
//
//  Created by Dedye on 21/06/20.
//  Copyright © 2020 Doku. All rights reserved.
//

#import "MandiriVaParams.h"

@implementation MandiriVaParams

- (instancetype)initWithText:(NSString *)clientId
                      amount:(NSString *)amount
               invoiceNumber:(NSString *)invoiceNumber
              reusableStatus:(NSString *)reusableStatus
                 expiredTime:(NSString *)expiredTime
                       info1:(NSString *)info1
                       info2:(NSString *)info2
                       info3:(NSString *)info3
                       email:(NSString *)email
                        name:(NSString *)name
                    checkSum:(NSString *)checkSum
{
    if (self = [super init])
    {
        self.clientId = clientId;
        self.amount = amount;
        self.invoiceNumber = invoiceNumber;
        self.reusableStatus = reusableStatus;
        self.expiredTime = expiredTime;
        self.info1 = info1;
        self.info2 = info2;
        self.info3 = info3;
        self.email = email;
        self.name = name;
        self.checkSum = checkSum;
    }
    return self;
}

@end
