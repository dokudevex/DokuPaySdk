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

@interface MandiriVaPresenter : NSObject<ToDoInteractorOutputProtocol>

@property (nonatomic, weak, nullable) id<ToDoViewProtocol> view;
@property (nonatomic) id<ToDoInteractorInputProtocol> interactor;
@property (nonatomic, weak) id<ToDoWireframeProtocol> router;

- (instancetype)initWithInterface:(id<ToDoViewProtocol>)interface
                       interactor:(id<ToDoInteractorInputProtocol>)interactor
                           router:(id<ToDoWireframeProtocol>)router;
- (void)addToDoItem:(NSString *)item;

@end

NS_ASSUME_NONNULL_END
