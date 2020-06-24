//
//  ResultPageContract.h
//  DokuPaySdk
//
//  Created by Dedye on 22/06/20.
//  Copyright © 2020 Doku. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MandiriVaResponse.h"

#pragma mark - WireFrameProtocol

@protocol ToDoResultPageWireframeProtocol <NSObject>

@end

#pragma mark - PresenterProtocol

@protocol ToDoResultPagePresenterProtocol <NSObject>

- (void)initData;

@end

#pragma mark - InteractorProtocol

@protocol ToDoResultPageInteractorOutputProtocol <NSObject>

- (void)successResponse:(NSString *)item;

- (void)errorResponse:(NSString *)item;

@end

@protocol ToDoResultPageInteractorInputProtocol <NSObject>

- (void)setOutput:(id<ToDoResultPageInteractorOutputProtocol>)output;
- (id<ToDoResultPageInteractorOutputProtocol>)getOutputProtocol;

- (void)getHowToInstruction:(NSString *)url;

@end

#pragma mark - ViewProtocol

@protocol ToDoResultPageViewProtocol <NSObject>

- (void)showResponse:(NSString *)item;

- (void)showError:(NSString *)response;

- (void)initData:(MandiriVaResponse *)data;

@end
