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

@interface MandiriSyariahVaPresenter: NSObject<ToDoMandiriSyariahVaInteractorOutputProtocol, ToDoMandiriSyariahVaPresenterProtocol>

@property (nonatomic, weak, nullable) id<ToDoMandiriSyariahVaViewProtocol> view;
@property (nonatomic) id<ToDoMandiriSyariahVaInteractorInputProtocol> interactor;
@property (nonatomic) id<ToDoMandiriSyariahVaWireframeProtocol> router;

- (instancetype)initWithInterface: (id<ToDoMandiriSyariahVaViewProtocol>)interface
                       interactor: (id<ToDoMandiriSyariahVaInteractorInputProtocol>)interactor
                           router: (id<ToDoMandiriSyariahVaWireframeProtocol>)router
                             data: (MandiriVaParams *)data;

- (void)getPaymentCode: (MandiriVaParams *)item
                   url: (NSString *) url;

@property (nonatomic, nullable) MandiriVaParams *mandiriVaParams;

@end

NS_ASSUME_NONNULL_END
