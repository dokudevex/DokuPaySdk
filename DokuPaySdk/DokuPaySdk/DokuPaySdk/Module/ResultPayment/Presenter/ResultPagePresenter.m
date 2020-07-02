//
//  ResultPagePresenter.m
//  DokuPaySdk
//
//  Created by Dedye on 22/06/20.
//  Copyright © 2020 Doku. All rights reserved.
//

#import "ResultPagePresenter.h"
#import "MandiriVaParams.h"
#import "MandiriVaResponse.h"

@implementation ResultPagePresenter

- (instancetype)initWithInterface: (id<ToDoResultPageViewProtocol>)interface
                       interactor: (id<ToDoResultPageInteractorInputProtocol>)interactor
                           router: (id<ToDoResultPageWireframeProtocol>)router
                             data: (MandiriVaResponse *)data
{
    if (self = [super init])
    {
        self.view = interface;
        self.interactor = interactor;
        self.router = router;
        self.mandiriVaResponse = data;
        [self.interactor setOutput: self];
    }
    return self;
}

- (void)getHowToInstruction: (NSString *)url {
    [self.interactor getHowToInstruction: url];
}

#pragma mark - ToDoResultPageInteractorOutputProtocol

- (void)successResponse: (NSString *)item {
    [self.view showResponse: item];
}

- (void)errorResponse: (NSString *)item {
    [self.view showError: item];
}

- (void)initData {
    [self.view initData: self.mandiriVaResponse];
}

@end
