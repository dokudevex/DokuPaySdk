//
//  MandiriSyariahVaPresenter.h
//  DokuPaySdk
//
//  Created by Dedye on 15/06/20.
//  Copyright © 2020 Doku. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MandiriSyariahVaContract.h"

NS_ASSUME_NONNULL_BEGIN

@interface MandiriSyariahVaPresenter : NSObject<ToDoMandiriSyariahInteractorOutputProtocol>

@property (nonatomic, weak, nullable) id<ToDoMandiriSyariahViewProtocol> view;
@property (nonatomic) id<ToDoMandiriSyariahInteractorInputProtocol> interactor;
@property (nonatomic, weak) id<ToDoMandiriSyariahWireframeProtocol> router;

- (instancetype)initWithInterface:(id<ToDoMandiriSyariahViewProtocol>)interface
                       interactor:(id<ToDoMandiriSyariahInteractorInputProtocol>)interactor
                           router:(id<ToDoMandiriSyariahWireframeProtocol>)router;
- (void)getPaymentCode:(MandiriVaParams *)item;

@end

NS_ASSUME_NONNULL_END
