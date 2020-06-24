//
//  MandiriVaPresenter.m
//  DokuPaySdk
//
//  Created by Dedye on 13/06/20.
//  Copyright © 2020 Doku. All rights reserved.
//

#import "MandiriVaPresenter.h"
#import "MandiriVaParams.h"
#import "MandiriVaResponse.h"

@implementation MandiriVaPresenter

- (instancetype)initWithInterface:(id<ToDoMandiriVaViewProtocol>)interface
                       interactor:(id<ToDoMandiriVaInteractorInputProtocol>)interactor
                           router:(id<ToDoMandiriVaWireframeProtocol>)router
{
    if (self = [super init])
    {
        self.view = interface;
        self.interactor = interactor;
        self.router = router;
        [self.interactor setOutput:self];
    }
    return self;
}

- (void)getPaymentCode:(MandiriVaParams *)item
{
    [self.interactor getPaymentCode:item];
}

#pragma mark - ToDoInteractorOutputProtocol

- (void)successResponse:(NSString *)item
{
    [self.view showResponse:item];
}

- (void)errorResponse:(NSString *)item {
    [self.view showError:item];
}

#pragma mark - PresenterProtocol

- (void)gotoResultPage:(MandiriVaResponse *)responseData {
    [self.router gotoResultPage: responseData];
}

@end
