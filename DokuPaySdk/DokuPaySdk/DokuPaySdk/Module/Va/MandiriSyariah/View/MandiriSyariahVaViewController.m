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
#import "DokuPayUtils.h"
#import "APIManager.h"
#import "APIConstant.h"

@interface MandiriSyariahVaViewController ()
@property (weak, nonatomic) IBOutlet UILabel *labelViewInfo;

@end

@implementation MandiriSyariahVaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.presenter initData];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [SVProgressHUD show];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.labelViewInfo setText: @""];
    [SVProgressHUD dismiss];
}

#pragma mark - WireFrameProtocol

- (void)showResponse: (NSString *)item {
    [SVProgressHUD dismiss];
    if ([self.mandiriVaParams.usePageResult isEqualToString: @"no"]) {
        [[DokuPaySdk sharedInstance] sendData: item];
        [[[DokuPaySdk sharedInstance] delegate] dismissViewControllerAnimated:YES completion:nil];
    } else if ([self.mandiriVaParams.usePageResult isEqualToString: @"yes"]) {
        MandiriVaResponse *data = [[MandiriVaResponse alloc] initWithData: item
                                                                   amount: self.mandiriVaParams.amount
                                                                channelId: self.mandiriVaParams.channelId
                                                             isProduction: self.mandiriVaParams.isProduction
                                                             merchantName: self.mandiriVaParams.merchantName];
    
        [self.presenter gotoResultPage: data];
    }
}

- (void)showError:(NSString *)response {
    [self.labelViewInfo setText: @""];
    [SVProgressHUD dismiss];
    UIAlertController *alertControl = [DokuPayUtils alertView: response
                                                    withTitle: @"Info"];
    [self presentViewController: alertControl
                       animated: YES
                     completion: nil];
    
    [alertControl addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [[[DokuPaySdk sharedInstance] delegate] dismissViewControllerAnimated:YES completion:nil];
    }]];
}

- (void)initData: (MandiriVaParams *)data {
    self.mandiriVaParams = data;
    NSString * url;
    
    if ([self.mandiriVaParams.isProduction isEqualToString: @"yes"]) {
        url = [NSString stringWithFormat:@"%@%@", ApiBaseUrlProduction, UrlVaMandiriSyariah];
    } else if ([self.mandiriVaParams.isProduction isEqualToString: @"no"]) {
        url = [NSString stringWithFormat:@"%@%@", ApiBaseUrlSandbox, UrlVaMandiriSyariah];
    }
    
    [self.presenter getPaymentCode: self.mandiriVaParams url: url];
}

@end
