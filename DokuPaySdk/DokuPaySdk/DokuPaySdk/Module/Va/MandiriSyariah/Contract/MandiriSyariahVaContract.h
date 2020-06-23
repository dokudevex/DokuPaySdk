//
//  MandiriSyariahVaContract.h
//  DokuPaySdk
//
//  Created by Dedye on 15/06/20.
//  Copyright © 2020 Doku. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MandiriVaParams.h"

#pragma mark - WireFrameProtocol

@protocol ToDoMandiriSyariahVaWireframeProtocol <NSObject>

- (void)gotoResultPage:(NSString *)responseData;

@end

#pragma mark - PresenterProtocol

@protocol ToDoMandiriSyariahVaPresenterProtocol <NSObject>

- (void)gotoResultPage:(NSString *)responseData;

@end

#pragma mark - InteractorProtocol

@protocol ToDoMandiriSyariahVaInteractorOutputProtocol <NSObject>

- (void)successResponse:(NSString *)item;

- (void)errorResponse:(NSString *)item;

@end

@protocol ToDoMandiriSyariahVaInteractorInputProtocol <NSObject>

- (void)setOutput:(id<ToDoMandiriSyariahVaInteractorOutputProtocol>)output;
- (id<ToDoMandiriSyariahVaInteractorOutputProtocol>)getOutputProtocol;

- (void)getPaymentCode:(MandiriVaParams *)item;

@end

#pragma mark - ViewProtocol

@protocol ToDoMandiriSyariahVaViewProtocol <NSObject>

- (void)showResponse:(NSString *)item;

- (void)showError:(NSString *)response;

@end
