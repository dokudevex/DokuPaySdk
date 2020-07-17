//
//  MandiriSyariahVaViewController.h
//  DokuPaySdk
//
//  Created by Dedye on 12/06/20.
//  Copyright © 2020 Doku. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MandiriSyariahVaPresenter.h"
#import "MandiriSyariahVaContract.h"
#import <DokuPaySdk/DokuPaySdk.h>

NS_ASSUME_NONNULL_BEGIN

@interface MandiriSyariahVaViewController: UIViewController<ToDoMandiriSyariahVaViewProtocol>

@property (nonatomic, nullable) MandiriSyariahVaPresenter *presenter;

@property (nonatomic, nullable) MandiriVaParams *mandiriVaParams;

@property (nonatomic, weak) id<DokuPaySdkDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
