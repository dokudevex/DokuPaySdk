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
#import "ResultPageRouter.h"
#import <UIKit/UIKit.h>

@implementation MandiriVaRouter

+ (UIViewController *)createModule: (MandiriVaParams *)data {
    UIStoryboard *mandiriVaStoryboard = [UIStoryboard storyboardWithName:@"MandiriStoryboard" bundle:[NSBundle bundleForClass: MandiriVaViewController.class]];
    MandiriVaViewController *viewController = [mandiriVaStoryboard instantiateViewControllerWithIdentifier:@"MandiriVaViewController"];
    
    MandiriVaInteractor *interactor = [[MandiriVaInteractor alloc] init];
    MandiriVaRouter *router = [[MandiriVaRouter alloc] init];
    MandiriVaPresenter *presenter = [[MandiriVaPresenter alloc] initWithInterface:viewController interactor:interactor router:router data: data];
    viewController.presenter = presenter;
    router.viewController = viewController;
    return viewController;
}

- (void)gotoResultPage:(MandiriVaResponse *)responseData {
    ResultPageViewController *todoViewController = (ResultPageViewController *) [ResultPageRouter createModule: responseData];
    [self.viewController presentViewController: todoViewController animated:YES completion: nil];
}

@end
