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
    
    [self.presenter initData];
}

#pragma mark - WireFrameProtocol

- (void)showResponse:(NSString *)item
{
    [SVProgressHUD dismiss];
    MandiriVaResponse *data = [[MandiriVaResponse alloc] initWithData : item
                                                               amount : self.mandiriVaParams.amount
                                                            channelId : self.mandiriVaParams.channelId
                                                         isProduction :self.mandiriVaParams.isProduction
                                                         merchantName : self.mandiriVaParams.merchantName];
    
    [self.presenter gotoResultPage: data];
}

- (void)showError:(NSString *)response {
    [SVProgressHUD dismiss];
    UIAlertController *alertControl = [DokuPayUtils alertView:response withTitle:@"Info"];
    [self presentViewController:alertControl animated:YES completion:nil];
}

- (void)initData:(MandiriVaParams *)data {
     self.mandiriVaParams = data;
    [self.presenter getPaymentCode: self.mandiriVaParams];
}

@end
