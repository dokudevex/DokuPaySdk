//
//  Utils.h
//  DokuPayDemo
//
//  Created by Dedye on 26/06/20.
//  Copyright © 2020 Doku. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Utils : NSObject

-(NSString*)sha256HashFor:(NSString*)input;

@end

NS_ASSUME_NONNULL_END
