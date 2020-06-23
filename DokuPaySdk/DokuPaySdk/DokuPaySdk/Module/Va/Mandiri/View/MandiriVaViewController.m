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

@interface MandiriVaViewController ()

@end

@implementation MandiriVaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [SVProgressHUD show];
    
    MandiriVaParams *item = [[MandiriVaParams alloc] initWithText:@"123-abc" amount:@"10000" invoiceNumber:@"DEMOSDK-1234567892" reusableStatus:@"false" expiredTime:@"60" info1:@"" info2:@"" info3:@"" email:@"demosdk@doku.com" name:@"demosdk" checkSum:@"9dda463a35d2c55212a5aa8e6b6bf17735e606224702f0722ae55a578e96213e"];
    
    [self.presenter getPaymentCode:item];
}

#pragma mark - WireFrameProtocol

- (void)showResponse:(NSString *)item
{
    [SVProgressHUD dismiss];
    //[self.presenter gotoResultPage: item];
    NSLog(@"Mandiri Va show response : %@", item);
    ResultPageViewController *todoViewController = (ResultPageViewController *) [ResultPageRouter createModule];
    [self presentViewController: todoViewController animated:YES completion: nil];
}

- (void)showError:(NSString *)response {
    [SVProgressHUD dismiss];
    NSLog(@"Mandiri Va error response : %@", response);
}
@end
