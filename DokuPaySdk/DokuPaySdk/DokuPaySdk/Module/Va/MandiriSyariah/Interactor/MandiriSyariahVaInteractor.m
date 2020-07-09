//
//  MandiriSyariahVaInteractor.m
//  DokuPaySdk
//
//  Created by Dedye on 15/06/20.
//  Copyright © 2020 Doku. All rights reserved.
//

#import "MandiriSyariahVaInteractor.h"
#import "MandiriVaParams.h"
#import "ApiMandiriSyariahVa.h"

@implementation MandiriSyariahVaInteractor

- (void)setOutput: (id<ToDoMandiriSyariahVaInteractorOutputProtocol>)output {
    _output = output;
}

- (id<ToDoMandiriSyariahVaInteractorOutputProtocol>)getOutputProtocol {
    return self.output;
}

- (void)getPaymentCode: (MandiriVaParams *)item
                   url: (NSString *)url {
    [ApiMandiriSyariahVa getPaymentCode: item
                                    url: (NSString *) url
                              ifSucceed: ^(NSString *response) {
        [self.output successResponse: response];
    } ifFailed: ^(NSError *error) {
        [self.output errorResponse: error.localizedDescription];
    }];
}

@end
