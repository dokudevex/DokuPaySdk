//
//  MandiriVaContract.h
//  DokuPaySdk
//
//  Created by Dedye on 13/06/20.
//  Copyright © 2020 Doku. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MandiriVaParams.h"

#pragma mark - WireFrameProtocol

@protocol ToDoMandiriVaWireframeProtocol <NSObject>

- (void)gotoResultPage:(NSString *)responseData;

@end

#pragma mark - PresenterProtocol

@protocol ToDoMandiriVaPresenterProtocol <NSObject>

- (void)gotoResultPage:(NSString *)responseData;

@end

#pragma mark - InteractorProtocol

@protocol ToDoMandiriVaInteractorOutputProtocol <NSObject>

- (void)successResponse:(NSString *)item;

- (void)errorResponse:(NSString *)item;

@end

@protocol ToDoMandiriVaInteractorInputProtocol <NSObject>

- (void)setOutput:(id<ToDoMandiriVaInteractorOutputProtocol>)output;
- (id<ToDoMandiriVaInteractorOutputProtocol>)getOutputProtocol;

- (void)getPaymentCode:(MandiriVaParams *)item;

@end

#pragma mark - ViewProtocol

@protocol ToDoMandiriVaViewProtocol <NSObject>

- (void)showResponse:(NSString *)item;

- (void)showError:(NSString *)response;

@end
