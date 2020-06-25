//
//  MandiriSyariahVaViewController.m
//  DokuPaySdk
//
//  Created by Dedye on 12/06/20.
//  Copyright © 2020 Doku. All rights reserved.
//

#import "MandiriSyariahVaViewController.h"
#import "SVProgressHUD.h"
#import "MandiriVaParams.h"
#import "ResultPageViewController.h"
#import "ResultPageRouter.h"

@interface MandiriSyariahVaViewController ()

@end

@implementation MandiriSyariahVaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [SVProgressHUD show];
    
    self.mandiriVaParams = [[MandiriVaParams alloc] initWithText:@"MCH-1103200003" amount:@"10000" invoiceNumber:@"DEMOSDK-89234457892" reusableStatus:@"false" expiredTime:@"60" info1:@"" info2:@"" info3:@"" email:@"demosdk@doku.com" name:@"demosdk" checkSum:@"9fe57a03b5321c5b76c9e2efc65eff6c8e0a5fceea0e5de42a19aa1f4169e0a4"];
    
    [self.presenter getPaymentCode: self.mandiriVaParams];

}

#pragma mark - WireFrameProtocol

- (void)showResponse:(NSString *)item
{
    [SVProgressHUD dismiss];
    MandiriVaResponse *data = [[MandiriVaResponse alloc] initWithData: item amount:self.mandiriVaParams.amount channelId: @"2" isProduction: @"false" merchantName: @"Toko Pak Edi"];
    
    [self.presenter gotoResultPage: data];
}

- (void)showError:(NSString *)response {
    [SVProgressHUD dismiss];
    NSLog(@"Mandiri Syariah Va error response : %@", response);
}

@end
