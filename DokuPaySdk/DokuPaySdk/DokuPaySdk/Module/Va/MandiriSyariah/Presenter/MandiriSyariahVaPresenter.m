//
//  MandiriSyariahVaPresenter.m
//  DokuPaySdk
//
//  Created by Dedye on 15/06/20.
//  Copyright © 2020 Doku. All rights reserved.
//

#import "MandiriSyariahVaPresenter.h"
#import "MandiriVaParams.h"
#import "MandiriVaResponse.h"

@implementation MandiriSyariahVaPresenter

- (instancetype)initWithInterface:(id<ToDoMandiriSyariahVaViewProtocol>)interface
                       interactor:(id<ToDoMandiriSyariahVaInteractorInputProtocol>)interactor
                           router:(id<ToDoMandiriSyariahVaWireframeProtocol>)router
                             data:(MandiriVaParams *)data;
{
    if (self = [super init])
    {
        self.view = interface;
        self.interactor = interactor;
        self.router = router;
        self.mandiriVaParams = data;
        [self.interactor setOutput:self];
    }
    return self;
}

- (void)getPaymentCode:(MandiriVaParams *)item
{
    [self.interactor getPaymentCode:item];
}

#pragma mark - ToDoMandiriSyariahInteractorOutputProtocol

- (void)successResponse:(NSString *)item
{
    [self.view showResponse:item];
}

- (void)errorResponse:(NSString *)item {
    [self.view showError: item];
}

#pragma mark - PresenterProtocol

- (void)gotoResultPage:(MandiriVaResponse *)responseData {
    [self.router gotoResultPage: responseData];
}

- (void)initData {
    [self.view initData: self.mandiriVaParams];
}


@end
