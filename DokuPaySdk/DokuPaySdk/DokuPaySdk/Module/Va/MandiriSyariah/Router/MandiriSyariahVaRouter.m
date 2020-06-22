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
    UIStoryboard *mandiriSyariahVaStoryboard = [UIStoryboard storyboardWithName:@"MandiriSyariahStoryboard" bundle:[NSBundle bundleForClass: MandiriSyariahVaViewController.class]];
    MandiriSyariahVaViewController *viewController = [mandiriSyariahVaStoryboard instantiateViewControllerWithIdentifier:@"MandiriSyariahVaViewController"];
    
    MandiriSyariahVaInteractor *interactor = [[MandiriSyariahVaInteractor alloc] init];
    
    MandiriSyariahVaRouter *router = [[MandiriSyariahVaRouter alloc] init];
    
    MandiriSyariahVaPresenter *presenter = [[MandiriSyariahVaPresenter alloc] initWithInterface:viewController interactor:interactor router:router];
    
    viewController.presenter = presenter;
    router.viewController = viewController;
    return viewController;
}

@end