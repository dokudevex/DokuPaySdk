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

- (instancetype)initWithInterface:(id<ToDoMandiriSyariahVaViewProtocol>)interface
                       interactor:(id<ToDoMandiriSyariahVaInteractorInputProtocol>)interactor
                           router:(id<ToDoMandiriSyariahVaWireframeProtocol>)router
{
    if (self = [super init])
    {
        NSLog(@"Dedye Presenter interface %@",interface);
        NSLog(@"Dedye Presenter router %@",router);
        
        self.view = interface;
        self.interactor = interactor;
        [self.interactor setOutput:self];
        self.router = router;
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

- (void)gotoResultPage:(NSString *)responseData {
    NSLog(@"Dedye Presenter");
    [self.router gotoResultPage: responseData];
    NSLog(@"Dedye Presenter router %@",self.router);
    NSLog(@"Dedye Presenter view %@",self.view);
    NSLog(@"Dedye Presenter interactor %@",self.interactor);
}

@end
