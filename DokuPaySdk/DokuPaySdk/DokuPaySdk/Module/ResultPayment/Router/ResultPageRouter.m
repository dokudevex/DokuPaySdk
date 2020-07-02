//
//  ResultPageRouter.m
//  DokuPaySdk
//
//  Created by Dedye on 22/06/20.
//  Copyright © 2020 Doku. All rights reserved.
//

#import "ResultPageRouter.h"
#import "MandiriSyariahVaViewController.h"
#import "ResultPageContract.h"
#import "ResultPageInteractor.h"
#import "ResultPagePresenter.h"

@implementation ResultPageRouter

+ (UIViewController *)createModule: (MandiriVaResponse *)data {
    UIStoryboard *resultPageViewControllerStoryboard = [UIStoryboard storyboardWithName: @"ResultPageViewControllerStoryboard"
                                                                                 bundle: [NSBundle bundleForClass: ResultPageViewController.class]];
    ResultPageViewController *viewController = [resultPageViewControllerStoryboard instantiateViewControllerWithIdentifier:@"ResultPageViewController"];
    
    ResultPageInteractor *interactor = [[ResultPageInteractor alloc] init];
    
    ResultPageRouter *router = [[ResultPageRouter alloc] init];
    
    ResultPagePresenter *presenter = [[ResultPagePresenter alloc] initWithInterface: viewController
                                                                         interactor: interactor
                                                                             router: router
                                                                               data: data];
    
    viewController.presenter = presenter;
    router.viewController = viewController;
    return viewController;
}
@end
