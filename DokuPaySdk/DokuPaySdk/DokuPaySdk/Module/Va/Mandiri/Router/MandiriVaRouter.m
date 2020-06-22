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
#import <UIKit/UIKit.h>

@implementation MandiriVaRouter

+ (UIViewController *)createModule
{
    UIStoryboard *mandiriVaStoryboard = [UIStoryboard storyboardWithName:@"MandiriStoryboard" bundle:[NSBundle bundleForClass: MandiriVaViewController.class]];
    MandiriVaViewController *viewController = [mandiriVaStoryboard instantiateViewControllerWithIdentifier:@"MandiriVaViewController"];
    
    MandiriVaInteractor *interactor = [[MandiriVaInteractor alloc] init];
    MandiriVaRouter *router = [[MandiriVaRouter alloc] init];
    MandiriVaPresenter *presenter = [[MandiriVaPresenter alloc] initWithInterface:viewController interactor:interactor router:router];
    viewController.presenter = presenter;
    router.viewController = viewController;
    return viewController;
}

@end
