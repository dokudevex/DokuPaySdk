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

- (instancetype)initWithInterface: (id<ToDoMandiriVaViewProtocol>)interface
                       interactor: (id<ToDoMandiriVaInteractorInputProtocol>)interactor
                           router: (id<ToDoMandiriVaWireframeProtocol>)router
                             data: (MandiriVaParams *)data {
    if (self = [super init]) {
        self.view = interface;
        self.interactor = interactor;
        self.router = router;
        self.mandiriVaParams = data;
        [self.interactor setOutput:self];
    }
    return self;
}

- (void)getPaymentCode: (MandiriVaParams *)item
                   url: (NSString *) url {
    [self.interactor getPaymentCode: item
                                url: url];
}

#pragma mark - ToDoInteractorOutputProtocol

- (void)successResponse: (NSString *)item {
    [self.view showResponse: item];
}

- (void)errorResponse: (NSString *)item {
    [self.view showError: item];
}

#pragma mark - PresenterProtocol

- (void)gotoResultPage: (MandiriVaResponse *)responseData {
    [self.router gotoResultPage: responseData];
}

- (void)initData {
    [self.view initData: self.mandiriVaParams];
}


@end
