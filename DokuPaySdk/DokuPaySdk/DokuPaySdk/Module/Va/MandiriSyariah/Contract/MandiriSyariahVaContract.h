//
//  MandiriSyariahVaContract.h
//  DokuPaySdk
//
//  Created by Dedye on 15/06/20.
//  Copyright © 2020 Doku. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark - WireFrameProtocol

@protocol ToDoWireframeProtocol <NSObject>

@end

#pragma mark - PresenterProtocol

@protocol ToDoPresenterProtocol <NSObject>

@end

#pragma mark - InteractorProtocol

@protocol ToDoInteractorOutputProtocol <NSObject>

- (void)sendAddedItem:(NSString *)item;

@end

@protocol ToDoInteractorInputProtocol <NSObject>

- (void)setOutput:(id<ToDoInteractorOutputProtocol>)output;
- (id<ToDoInteractorOutputProtocol>)getOutputProtocol;

- (void)addToDoItem:(NSString *)item;

@end

#pragma mark - ViewProtocol

@protocol ToDoViewProtocol <NSObject>

- (void)showAddedItem:(NSString *)item;

@end
