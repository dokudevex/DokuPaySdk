//
//  ResultPagePresenter.h
//  DokuPaySdk
//
//  Created by Dedye on 22/06/20.
//  Copyright © 2020 Doku. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ResultPageContract.h"

NS_ASSUME_NONNULL_BEGIN

@interface ResultPagePresenter : NSObject<ToDoResultPageInteractorOutputProtocol, ToDoResultPagePresenterProtocol>

@property (nonatomic, weak, nullable) id<ToDoResultPageViewProtocol> view;
@property (nonatomic) id<ToDoResultPageInteractorInputProtocol> interactor;
@property (nonatomic) id<ToDoResultPageWireframeProtocol> router;

- (instancetype)initWithInterface:(id<ToDoResultPageViewProtocol>)interface
                       interactor:(id<ToDoResultPageInteractorInputProtocol>)interactor
                           router:(id<ToDoResultPageWireframeProtocol>)router
                            data:(MandiriVaResponse *)data;

- (void)getHowToInstruction:(NSString *)url;

@property (nonatomic, nullable) MandiriVaResponse *mandiriVaResponse;

@end

NS_ASSUME_NONNULL_END
