//
//  MandiriVaInteractor.m
//  DokuPaySdk
//
//  Created by Dedye on 14/06/20.
//  Copyright © 2020 Doku. All rights reserved.
//

#import "MandiriVaInteractor.h"
#import "MandiriVaParams.h"
#import "ApiMandiriVa.h"

@implementation MandiriVaInteractor

- (void)setOutput: (id<ToDoMandiriVaInteractorOutputProtocol>)output {
    _output = output;
}

- (id<ToDoMandiriVaInteractorOutputProtocol>)getOutputProtocol {
    return self.output;
}

- (void)getPaymentCode: (MandiriVaParams *)item
                   url: (NSString *)url {
    [ApiMandiriVa getPaymentCode: item
                             url: (NSString *) url
                       ifSucceed: ^(NSString *response) {
        [self.output successResponse: response];
    } ifFailed: ^(NSError *error) {
        [self.output errorResponse: error.localizedDescription];
    }];
}

@end
