//
//  ResultPageRouter.h
//  DokuPaySdk
//
//  Created by Dedye on 22/06/20.
//  Copyright © 2020 Doku. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ResultPageContract.h"
#import "ResultPageViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface ResultPageRouter : NSObject<ToDoResultPageWireframeProtocol>

@property (nonatomic, weak) ResultPageViewController *viewController;

+ (UIViewController *)createModule: (MandiriVaResponse *)data;

@end

NS_ASSUME_NONNULL_END
