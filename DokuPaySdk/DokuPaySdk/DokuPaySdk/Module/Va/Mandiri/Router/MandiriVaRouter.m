//
//  MandiriVaRouter.m
//  DokuPaySdk
//
//  Created by Dedye on 14/06/20.
//  Copyright © 2020 Doku. All rights reserved.
//

#import "MandiriVaRouter.h"
#import "MandiriVaViewController.h"
#import "MandiriVaContract.h"
#import "MandiriVaInteractor.h"
#import "MandiriVaPresenter.h"

@implementation MandiriVaRouter

+ (UIViewController *)createModule
{
    NSString *viewName = NSStringFromClass([MandiriVaViewController class]);
    MandiriVaViewController *viewController = [[MandiriVaViewController alloc] initWithNibName:viewName bundle:nil];
    MandiriVaInteractor *interactor = [[MandiriVaInteractor alloc] init];
    MandiriVaRouter *router = [[MandiriVaRouter alloc] init];
    MandiriVaPresenter *presenter = [[MandiriVaPresenter alloc] initWithInterface:viewController interactor:interactor router:router];
    viewController.presenter = presenter;
    router.viewController = viewController;
    return viewController;
}

@end
