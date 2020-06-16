//
//  MandiriVaInteractor.m
//  DokuPaySdk
//
//  Created by Dedye on 14/06/20.
//  Copyright © 2020 Doku. All rights reserved.
//

#import "MandiriVaInteractor.h"

@implementation MandiriVaInteractor

- (void)setOutput:(id<ToDoInteractorOutputProtocol>)output
{
    _output = output;
}

- (id<ToDoInteractorOutputProtocol>)getOutputProtocol
{
    return self.output;
}

- (void)addToDoItem:(NSString *)item
{
    [self.output sendAddedItem:item];
}

@end
