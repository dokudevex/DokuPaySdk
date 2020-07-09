//
//  BottomSheetViewController.m
//  DokuPayDemo
//
//  Created by Dedye on 09/07/20.
//  Copyright © 2020 Doku. All rights reserved.
//

#import "BottomSheetViewController.h"
#import "STPopup.h"

@interface BottomSheetViewController ()
@property (weak, nonatomic) IBOutlet UILabel *labelName;

@end

@implementation BottomSheetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.contentSizeInPopup = CGSizeMake(0, 400);
    self.landscapeContentSizeInPopup = CGSizeMake(400, 200);
}

@end
