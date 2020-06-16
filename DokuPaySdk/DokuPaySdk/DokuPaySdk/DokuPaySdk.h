//
//  DokuPaySdk.h
//  DokuPaySdk
//
//  Created by Dedye on 12/06/20.
//  Copyright © 2020 Doku. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DokuPaySdk <NSObject>
@end

@interface DokuPaySdk : NSObject

@property (nullable, nonatomic, weak) id<DokuPaySdk>delegate;

-(void) connectSdk;

+(nonnull id)sharedInstance;

@end

