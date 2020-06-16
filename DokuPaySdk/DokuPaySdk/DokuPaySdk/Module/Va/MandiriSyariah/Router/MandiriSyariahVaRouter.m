//
//  MandiriSyariahRouter.m
//  DokuPaySdk
//
//  Created by Dedye on 15/06/20.
//  Copyright © 2020 Doku. All rights reserved.
//

#import "MandiriSyariahVaRouter.h"
#import "MandiriSyariahVaViewController.h"
#import "MandiriSyariahVaContract.h"
#import "MandiriSyariahVaInteractor.h"
#import "MandiriSyariahVaPresenter.h"

@implementation MandiriSyariahVaRouter

+ (UIViewController *)createModule
{
    NSString *viewName = NSStringFromClass([MandiriSyariahVaViewController class]);
    
    MandiriSyariahVaViewController *viewController = [[MandiriSyariahVaViewController alloc] initWithNibName:viewName bundle:nil];
    MandiriSyariahVaInteractor *interactor = [[MandiriSyariahVaInteractor alloc] init];
    
    MandiriSyariahVaRouter *router = [[MandiriSyariahVaRouter alloc] init];
    
    MandiriSyariahVaPresenter *presenter = [[MandiriSyariahVaPresenter alloc] initWithInterface:viewController interactor:interactor router:router];
    
    viewController.presenter = presenter;
    router.viewController = viewController;
    return viewController;
}

@end
