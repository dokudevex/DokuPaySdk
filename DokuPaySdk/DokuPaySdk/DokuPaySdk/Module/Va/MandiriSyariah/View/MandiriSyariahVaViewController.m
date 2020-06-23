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
    
    MandiriVaParams *item = [[MandiriVaParams alloc] initWithText:@"MCH-1103200003" amount:@"10000" invoiceNumber:@"DEMOSDK-1234567892" reusableStatus:@"false" expiredTime:@"60" info1:@"" info2:@"" info3:@"" email:@"demosdk@doku.com" name:@"demosdk" checkSum:@"673940c827ffdd6a8ab7b82ec12adfe703e75273e06379156724f0a83a5477ba"];
    
    [self.presenter getPaymentCode:item];

}

#pragma mark - WireFrameProtocol

- (void)showResponse:(NSString *)item
{
    [SVProgressHUD dismiss];
    NSLog(@"Mandiri Syariah Va show response : %@", item);
    //[self.presenter gotoResultPage: item];
    ResultPageViewController *todoViewController = (ResultPageViewController *) [ResultPageRouter createModule];
    [self presentViewController: todoViewController animated:YES completion: nil];
}

- (void)showError:(NSString *)response {
    [SVProgressHUD dismiss];
    NSLog(@"Mandiri Syariah Va error response : %@", response);
}

@end
