//
//  MandiriVaInteractor.h
//  DokuPaySdk
//
//  Created by Dedye on 14/06/20.
//  Copyright © 2020 Doku. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MandiriVaContract.h"

NS_ASSUME_NONNULL_BEGIN

@interface MandiriVaInteractor : NSObject<ToDoInteractorInputProtocol>

@property (nonatomic, weak, nullable) id<ToDoInteractorOutputProtocol> output;

@end

NS_ASSUME_NONNULL_END
