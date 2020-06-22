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

@interface MandiriSyariahVaViewController ()

@end

@implementation MandiriSyariahVaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [SVProgressHUD show];
    
    MandiriVaParams *item = [[MandiriVaParams alloc] initWithText:@"123-abc" amount:@"10000" invoiceNumber:@"DEMOSDK-1234567892" reusableStatus:@"false" expiredTime:@"60" info1:@"" info2:@"" info3:@"" email:@"demosdk@doku.com" name:@"demosdk" checkSum:@""];
    
    [self.presenter getPaymentCode:item];

}

#pragma mark - WireFrameProtocol

- (void)showResponse:(NSString *)item
{
    [SVProgressHUD dismiss];
    NSLog(@"Dedye Response : %@", item);
}

- (void)showError:(NSString *)response {
    [SVProgressHUD dismiss];
    NSLog(@"Dedye Response : %@", response);
}

@end
