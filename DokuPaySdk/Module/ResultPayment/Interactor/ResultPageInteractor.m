//
//  ResultPageInteractor.m
//  DokuPaySdk
//
//  Created by Dedye on 22/06/20.
//  Copyright © 2020 Doku. All rights reserved.
//

#import "ResultPageInteractor.h"
#import "ApiResultPage.h"

@implementation ResultPageInteractor

- (void)setOutput: (id<ToDoResultPageInteractorOutputProtocol>)output {
    _output = output;
}

- (id<ToDoResultPageInteractorOutputProtocol>)getOutputProtocol {
    return self.output;
}

- (void)getHowToInstruction: (NSString *)url {
    [ApiResultPage getHowToInstruction: url
                             ifSucceed: ^(NSString *response) {
        [self.output successResponse: response];
    } ifFailed: ^(NSError *error) {
        [self.output errorResponse: error.localizedDescription];
    }];
}
@end
