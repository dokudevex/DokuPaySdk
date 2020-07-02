//
//  ResultPageDemoViewController.m
//  DokuPayDemo
//
//  Created by Dedye on 02/07/20.
//  Copyright © 2020 Doku. All rights reserved.
//

#import "ResultPageDemoViewController.h"
#import "DokuUtils.h"

@interface ResultPageDemoViewController ()
@property (weak, nonatomic) IBOutlet UILabel *labelViewOrderId;
@property (weak, nonatomic) IBOutlet UILabel *labelViewAmount;
@property (weak, nonatomic) IBOutlet UILabel *labelViewVaChannel;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewIconChannel;
@property (weak, nonatomic) IBOutlet UILabel *labelViewNoVa;

@end

@implementation ResultPageDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear: (BOOL)animated {
    [super viewWillAppear: animated];
    self.navigationController.navigationBar.backItem.title = @"";

    NSData *nsData = [self.dataResponse dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary* dictionary = [DokuUtils nsDataToDictionary: nsData];
    
    NSDictionary *order = [dictionary objectForKey:@"order"];
    NSDictionary *virtual_account_info = [dictionary objectForKey:@"virtual_account_info"];
    
    self.navigationController.navigationBar.topItem.title = self.merchantName;
    
    [self.labelViewOrderId setText: [order objectForKey:@"invoice_number"]];
    
    [self.labelViewAmount setText: self.amount];
    
    [self.labelViewNoVa setText: [virtual_account_info objectForKey:@"virtual_account_number"]];
    
    if (self.channelId == 1) {
        [self.imageViewIconChannel setImage: [DokuUtils getIcon: [NSString stringWithFormat:@"%i", self.channelId]]];
        [self.labelViewVaChannel setText: @"Mandiri"];
    } else if (self.channelId == 2) {
        [self.imageViewIconChannel setImage: [DokuUtils getIcon:[NSString stringWithFormat:@"%i", self.channelId]]];
        [self.labelViewVaChannel setText: @"Mandiri Syariah"];
    }
}

@end
