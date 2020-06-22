//
//  MandiriVaViewController.h
//  DokuPaySdk
//
//  Created by Dedye on 12/06/20.
//  Copyright © 2020 Doku. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MandiriVaPresenter.h"
#import "MandiriVaContract.h"

NS_ASSUME_NONNULL_BEGIN

@interface MandiriVaViewController : UIViewController<ToDoMandiriVaViewProtocol>

@property (nonatomic, nullable) MandiriVaPresenter *presenter;

@end

NS_ASSUME_NONNULL_END
