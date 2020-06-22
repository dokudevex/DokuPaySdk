//
//  DokuPayUtils.h
//  DokuPaySdk
//
//  Created by Dedye on 22/06/20.
//  Copyright © 2020 Doku. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MandiriVaParams.h"

NS_ASSUME_NONNULL_BEGIN

@interface DokuPayUtils : NSObject

+(NSMutableDictionary*)createMandiriParams:(MandiriVaParams*)params;

@end

NS_ASSUME_NONNULL_END
