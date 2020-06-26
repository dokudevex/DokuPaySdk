//
//  MandiriVaViewController.m
//  DokuPaySdk
//
//  Created by Dedye on 12/06/20.
//  Copyright © 2020 Doku. All rights reserved.
//

#import "MandiriVaViewController.h"
#import "SVProgressHUD.h"
#import "ResultPageViewController.h"
#import "ResultPageRouter.h"
#import "MandiriVaResponse.h"
#import "DokuPayUtils.h"

@interface MandiriVaViewController ()

@end

@implementation MandiriVaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [SVProgressHUD show];
    
    self.mandiriVaParams = [[MandiriVaParams alloc] initWithText:@"123-abc"
                                                          amount:@"10000"
                                                   invoiceNumber:@"DEMOSDK-1434531892"
                                                  reusableStatus:@"false"
                                                     expiredTime:@"60"
                                                           info1:@""
                                                           info2:@""
                                                           info3:@""
                                                           email:@"demosdk@doku.com"
                                                            name:@"demosdk"
                                                        checkSum:@"a59e9920a535d7607110a1d9411d8eadce9b21b6b65c43e3084163430a3ed88c"];
    
    [self.presenter getPaymentCode: self.mandiriVaParams];
}

#pragma mark - WireFrameProtocol

- (void)showResponse:(NSString *)item
{
    [SVProgressHUD dismiss];
    MandiriVaResponse *data = [[MandiriVaResponse alloc] initWithData: item
                                                               amount:self.mandiriVaParams.amount
                                                            channelId: @"1"
                                                         isProduction: @"false"
                                                         merchantName: @"Toko Pak Edi"];
    
    [self.presenter gotoResultPage: data];
}

- (void)showError:(NSString *)response {
    [SVProgressHUD dismiss];
    UIAlertController *alertControl = [DokuPayUtils alertView:response withTitle:@"Info"];
    [self presentViewController:alertControl animated:YES completion:nil];
}
@end
