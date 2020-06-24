//
//  MandiriVaPresenter.h
//  DokuPaySdk
//
//  Created by Dedye on 13/06/20.
//  Copyright © 2020 Doku. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MandiriVaContract.h"

NS_ASSUME_NONNULL_BEGIN

@interface MandiriVaPresenter : NSObject<ToDoMandiriVaInteractorOutputProtocol, ToDoMandiriVaPresenterProtocol>

@property (nonatomic, weak, nullable) id<ToDoMandiriVaViewProtocol> view;
@property (nonatomic) id<ToDoMandiriVaInteractorInputProtocol> interactor;
@property (nonatomic) id<ToDoMandiriVaWireframeProtocol> router;

- (instancetype)initWithInterface:(id<ToDoMandiriVaViewProtocol>)interface
                       interactor:(id<ToDoMandiriVaInteractorInputProtocol>)interactor
                           router:(id<ToDoMandiriVaWireframeProtocol>)router;

- (void)getPaymentCode:(MandiriVaParams *)item;

@end

NS_ASSUME_NONNULL_END
