//
//  MandiriSyariahVaPresenter.m
//  DokuPaySdk
//
//  Created by Dedye on 15/06/20.
//  Copyright © 2020 Doku. All rights reserved.
//

#import "MandiriSyariahVaPresenter.h"
#import "MandiriVaParams.h"

@implementation MandiriSyariahVaPresenter

- (instancetype)initWithInterface:(id<ToDoMandiriSyariahViewProtocol>)interface
                       interactor:(id<ToDoMandiriSyariahInteractorInputProtocol>)interactor
                           router:(id<ToDoMandiriSyariahWireframeProtocol>)router
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

#pragma mark - ToDoMandiriSyariahInteractorOutputProtocol

- (void)successResponse:(NSString *)item
{
    [self.view showResponse:item];
}

- (void)errorResponse:(NSString *)item {
    [self.view showError: item];
}


@end
