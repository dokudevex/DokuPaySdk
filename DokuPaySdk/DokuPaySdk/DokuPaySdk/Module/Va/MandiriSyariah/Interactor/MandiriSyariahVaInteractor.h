//
//  MandiriSyariahInteractor.h
//  DokuPaySdk
//
//  Created by Dedye on 15/06/20.
//  Copyright © 2020 Doku. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MandiriSyariahVaContract.h"

NS_ASSUME_NONNULL_BEGIN

@interface MandiriSyariahVaInteractor : NSObject<ToDoMandiriSyariahVaInteractorInputProtocol>

@property (nonatomic, weak, nullable) id<ToDoMandiriSyariahVaInteractorOutputProtocol> output;

@end

NS_ASSUME_NONNULL_END
