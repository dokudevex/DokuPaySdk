//
//  MandiriVaResponse.h
//  DokuPayDemo
//
//  Created by Dedye on 02/07/20.
//  Copyright © 2020 Doku. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MandiriVaResponse: NSObject

@property (nonatomic) NSString *clientId;
@property (nonatomic) NSString *invoiceNumber;
@property (nonatomic) NSString *vaNumber;
@property (nonatomic) NSString *createdDate;
@property (nonatomic) NSString *howToPayApi;
@property (nonatomic) NSString *howToPayPage;
@property (nonatomic) NSString *ExpiredDate;
@property (nonatomic) NSString *amount;
@property (nonatomic) NSString *channelId;
@property (nonatomic) NSString *isProduction;
@property (nonatomic) NSString *merchantName;

- (instancetype)initWithData: (NSString *)data
                      amount: (NSString *)amount
                   channelId: (NSString *)channelId
                isProduction: (NSString *)isProduction
                merchantName: (NSString *)merchantName;

@end

NS_ASSUME_NONNULL_END
