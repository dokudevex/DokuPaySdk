//
//  ResultPagePresenter.m
//  DokuPaySdk
//
//  Created by Dedye on 22/06/20.
//  Copyright © 2020 Doku. All rights reserved.
//

#import "ResultPagePresenter.h"
#import "MandiriVaParams.h"

@implementation ResultPagePresenter

- (instancetype)initWithInterface:(id<ToDoResultPageViewProtocol>)interface
                       interactor:(id<ToDoResultPageInteractorInputProtocol>)interactor
                           router:(id<ToDoResultPageWireframeProtocol>)router
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

- (void)getHowToInstruction:(NSString *)noVa
{
    [self.interactor getHowToInstruction:noVa];
}

#pragma mark - ToDoResultPageInteractorOutputProtocol

- (void)successResponse:(NSString *)item
{
    [self.view showResponse:item];
}

- (void)errorResponse:(NSString *)item {
    [self.view showError: item];
}
@end
