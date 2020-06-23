//
//  ApiResultPage.h
//  DokuPaySdk
//
//  Created by Dedye on 22/06/20.
//  Copyright © 2020 Doku. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ApiResultPage : NSObject

+ (void)getHowToInstruction:(NSString *)noVa ifSucceed:(void (^)(NSString *response))succeed ifFailed:(void (^)(NSError *error))failed;

@end

NS_ASSUME_NONNULL_END
