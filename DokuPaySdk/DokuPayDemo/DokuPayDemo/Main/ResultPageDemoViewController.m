//
//  ResultPageDemoViewController.m
//  DokuPayDemo
//
//  Created by Dedye on 02/07/20.
//  Copyright © 2020 Doku. All rights reserved.
//

#import "ResultPageDemoViewController.h"
#import "DokuUtils.h"
#import "DokuStyle.h"
#import "UIColor+DokuColor.h"
#import "UIFont+DokuFont.h"
#import "STPopup.h"
#import "DokuUtils.h"

@interface ResultPageDemoViewController ()
@property (weak, nonatomic) IBOutlet UILabel *labelViewOrderId;
@property (weak, nonatomic) IBOutlet UILabel *labelViewAmount;
@property (weak, nonatomic) IBOutlet UILabel *labelViewVaChannel;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewIconChannel;
@property (weak, nonatomic) IBOutlet UILabel *labelViewNoVa;
@property (weak, nonatomic) IBOutlet UIView *viewOrder;
@property (weak, nonatomic) IBOutlet UIButton *buttonDetails;
@property (weak, nonatomic) IBOutlet UIView *viewPleaseTransfer;
@property (weak, nonatomic) IBOutlet UIView *viewPowerBy;
@property (weak, nonatomic) IBOutlet UILabel *labelViewExpiredDateTime;
@property (weak, nonatomic) IBOutlet UILabel *labelViewVirtualAccount;

@end

@implementation ResultPageDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupForm];
}

- (IBAction)buttonBack:(id)sender {
    NSLog(@"Dedye Close");
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)buttonDetails:(id)sender {
    STPopupController *popupController = [[STPopupController alloc]
                                          initWithRootViewController: [[UIStoryboard storyboardWithName: @"BottomSheetViewControllerStoryboard"
                                                                                                 bundle: [NSBundle bundleForClass:self.class]]
                                                                       instantiateViewControllerWithIdentifier: @"BottomSheetViewController"]];
    popupController.style = STPopupStyleBottomSheet;
    popupController.navigationBarHidden = true;
    [popupController.backgroundView addGestureRecognizer: [[UITapGestureRecognizer alloc] initWithTarget: self
                                                                                                  action: @selector(handleSingleTap:)]];
    [popupController presentInViewController: self];
}

- (void)handleSingleTap: (UITapGestureRecognizer *)recognizer {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)userTappedOnLink:(UIGestureRecognizer*)gestureRecognizer {
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    pasteboard.string = self.labelViewNoVa.text;
}

- (void) setupForm {
    UITapGestureRecognizer* gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(userTappedOnLink:)];
    [self.labelViewVirtualAccount setUserInteractionEnabled:YES];
    [self.labelViewVirtualAccount addGestureRecognizer:gesture];
    
    [DokuStyle DokuButonRoundedTopLeftRight: self.buttonDetails];
    
    self.viewOrder.layer.borderWidth = 1;
    self.viewOrder.layer.cornerRadius = 10;
    self.viewOrder.layer.borderColor = [UIColor dokuSeparator].CGColor;
    
    self.viewPowerBy.layer.borderWidth = 1;
    self.viewPowerBy.layer.cornerRadius = 10;
    self.viewPowerBy.layer.borderColor = [UIColor dokuSeparator].CGColor;
    
    self.viewPleaseTransfer.layer.borderWidth = 1;
    self.viewPleaseTransfer.layer.cornerRadius = 10;
    self.viewPleaseTransfer.layer.borderColor = [UIColor dokuSeparator].CGColor;
    
}

- (void)viewWillAppear: (BOOL)animated {
    [super viewWillAppear: animated];
    self.navigationController.navigationBar.backItem.title = @"";

    NSData *nsData = [self.dataResponse dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary* dictionary = [DokuUtils nsDataToDictionary: nsData];
    
    NSDictionary *order = [dictionary objectForKey:@"order"];
    NSDictionary *virtual_account_info = [dictionary objectForKey:@"virtual_account_info"];
    NSString *expiredDate = [virtual_account_info objectForKey:@"expired_date"];
    
    self.navigationController.navigationBar.topItem.title = self.merchantName;
    
    NSString * createInvoice = [NSString stringWithFormat:@"%@%@",@"Order ID : ", [order objectForKey:@"invoice_number"]];
    
    [self.labelViewOrderId setText: createInvoice];
    
    [self.labelViewAmount setText: self.amount];
    
    [self.labelViewNoVa setText: [virtual_account_info objectForKey:@"virtual_account_number"]];
    
    if (self.channelId == 1) {
        [self.imageViewIconChannel setImage: [DokuUtils getIcon: [NSString stringWithFormat:@"%i", self.channelId]]];
        [self.labelViewVaChannel setText: @"Mandiri"];
    } else if (self.channelId == 2) {
        [self.imageViewIconChannel setImage: [DokuUtils getIcon:[NSString stringWithFormat:@"%i", self.channelId]]];
        [self.labelViewVaChannel setText: @"Mandiri Syariah"];
    }
    
    NSString * formatDateTimeExpired = [DokuUtils formatDatetoString: [DokuUtils stringDateToDate: expiredDate
                                                                                       dateFormat: @"yyyyMMddHHmmss"]
                                                             dateFormat: @"dd MMMM yyyy HH:mm"];
    [self.labelViewExpiredDateTime setText: formatDateTimeExpired];
}

@end
