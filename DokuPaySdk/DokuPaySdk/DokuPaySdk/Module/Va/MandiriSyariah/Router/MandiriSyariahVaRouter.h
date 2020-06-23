//
//  MandiriSyariahRouter.h
//  DokuPaySdk
//
//  Created by Dedye on 15/06/20.
//  Copyright © 2020 Doku. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MandiriSyariahVaContract.h"
#import "MandiriSyariahVaViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface MandiriSyariahVaRouter : NSObject<ToDoMandiriSyariahVaWireframeProtocol>

@property (nonatomic, weak) MandiriSyariahVaViewController *viewController;

+ (UIViewController *)createModule;

@end

NS_ASSUME_NONNULL_END
