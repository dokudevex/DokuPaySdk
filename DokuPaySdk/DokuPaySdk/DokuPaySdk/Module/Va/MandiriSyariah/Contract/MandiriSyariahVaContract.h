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

@protocol ToDoMandiriSyariahWireframeProtocol <NSObject>

@end

#pragma mark - PresenterProtocol

@protocol ToDoMandiriSyariahPresenterProtocol <NSObject>

@end

#pragma mark - InteractorProtocol

@protocol ToDoMandiriSyariahInteractorOutputProtocol <NSObject>

- (void)successResponse:(NSString *)item;

- (void)errorResponse:(NSString *)item;

@end

@protocol ToDoMandiriSyariahInteractorInputProtocol <NSObject>

- (void)setOutput:(id<ToDoMandiriSyariahInteractorOutputProtocol>)output;
- (id<ToDoMandiriSyariahInteractorOutputProtocol>)getOutputProtocol;

- (void)getPaymentCode:(MandiriVaParams *)item;

@end

#pragma mark - ViewProtocol

@protocol ToDoMandiriSyariahViewProtocol <NSObject>

- (void)showResponse:(NSString *)item;

- (void)showError:(NSString *)response;

@end
