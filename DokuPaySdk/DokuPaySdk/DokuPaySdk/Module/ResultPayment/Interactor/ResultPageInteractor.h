//
//  ResultPageInteractor.h
//  DokuPaySdk
//
//  Created by Dedye on 22/06/20.
//  Copyright © 2020 Doku. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ResultPageContract.h"

NS_ASSUME_NONNULL_BEGIN

@interface ResultPageInteractor : NSObject<ToDoResultPageInteractorInputProtocol>

@property (nonatomic, weak, nullable) id<ToDoResultPageInteractorOutputProtocol> output;


@end

NS_ASSUME_NONNULL_END
