//
//  MandiriVaPresenter.m
//  DokuPaySdk
//
//  Created by Dedye on 13/06/20.
//  Copyright © 2020 Doku. All rights reserved.
//

#import "MandiriVaPresenter.h"

@implementation MandiriVaPresenter

- (instancetype)initWithInterface:(id<ToDoViewProtocol>)interface
                       interactor:(id<ToDoInteractorInputProtocol>)interactor
                           router:(id<ToDoWireframeProtocol>)router
{
    if (self = [super init])
    {
        self.view = interface;
        self.interactor = interactor;
        self.router = router;
        [self.interactor setOutput:self];
    }
    return self;
}

- (void)addToDoItem:(NSString *)item
{
    [self.interactor addToDoItem:item];
}

#pragma mark - ToDoInteractorOutputProtocol

- (void)sendAddedItem:(NSString *)item
{
    [self.view showAddedItem:item];
}

@end
