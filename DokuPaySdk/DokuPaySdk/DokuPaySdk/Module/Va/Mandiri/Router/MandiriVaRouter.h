//
//  MandiriVaRouter.h
//  DokuPaySdk
//
//  Created by Dedye on 14/06/20.
//  Copyright © 2020 Doku. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MandiriVaViewController.h"
#import "MandiriVaContract.h"

NS_ASSUME_NONNULL_BEGIN

@interface MandiriVaRouter : NSObject<ToDoMandiriVaWireframeProtocol>

@property (nonatomic, weak) MandiriVaViewController *viewController;

+ (UIViewController *)createModule;

@end

NS_ASSUME_NONNULL_END
