//
//  MandiriVaHowToInstruction.h
//  DokuPaySdk
//
//  Created by Dedye on 25/06/20.
//  Copyright © 2020 Doku. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MandiriVaHowToInstruction: NSObject

@property (nonatomic) NSArray *howToPay;
@property (nonatomic) NSString *expiredTime;

- (instancetype)initWithData: (NSString *)data;

@end

NS_ASSUME_NONNULL_END
