//
//  MandiriSyariahVaContract.h
//  DokuPaySdk
//
//  Created by Dedye on 15/06/20.
//  Copyright © 2020 Doku. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MandiriVaParams.h"
#import "MandiriVaResponse.h"

#pragma mark - WireFrameProtocol

@protocol ToDoMandiriSyariahVaWireframeProtocol <NSObject>

- (void)gotoResultPage: (MandiriVaResponse *)responseData;

@end

#pragma mark - PresenterProtocol

@protocol ToDoMandiriSyariahVaPresenterProtocol <NSObject>

- (void)gotoResultPage: (MandiriVaResponse *)responseData;

- (void)initData;

@end

#pragma mark - InteractorProtocol

@protocol ToDoMandiriSyariahVaInteractorOutputProtocol <NSObject>

- (void)successResponse: (NSString *)item;

- (void)errorResponse: (NSString *)item;

@end

@protocol ToDoMandiriSyariahVaInteractorInputProtocol <NSObject>

- (void)setOutput: (id<ToDoMandiriSyariahVaInteractorOutputProtocol>)output;

- (id<ToDoMandiriSyariahVaInteractorOutputProtocol>)getOutputProtocol;

- (void)getPaymentCode: (MandiriVaParams *)item
                   url: (NSString *) url;

@end

#pragma mark - ViewProtocol

@protocol ToDoMandiriSyariahVaViewProtocol <NSObject>

- (void)showResponse: (NSString *)item;

- (void)showError: (NSString *)response;

- (void)initData: (MandiriVaParams *)data;

@end
