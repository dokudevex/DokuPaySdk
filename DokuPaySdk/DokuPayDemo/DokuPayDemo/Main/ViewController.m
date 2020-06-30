//
//  ViewController.m
//  DokuPayDemo
//
//  Created by Dedye on 12/06/20.
//  Copyright © 2020 Doku. All rights reserved.
//

#import "ViewController.h"
#import <DokuPaySdk/DokuPaySdk.h>
#import "SettingPageViewController.h"
#import <ActionSheetPicker.h>
#import "DokuUtils.h"
#import "DokuConstants.h"

static int const kHeaderSectionTag = 6900;

@interface ViewController () 

@property (assign) NSInteger expandedSectionHeaderNumber;
@property (assign) UITableViewHeaderFooterView *expandedSectionHeader;
@property (strong) NSArray *sectionItems;
@property (strong) NSArray *sectionNames;
@property (strong, nonatomic) SettingPageViewController *settingPageViewController;
@property (weak, nonatomic) IBOutlet UITableView *tableViewAccordion;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *getMerchantName = [DokuUtils getValueFromNSUserDefaultForKey:merchantName];
    self.title = getMerchantName;
    
    self.sectionNames = @[ @"Credit Card", @"E-Money", @"Transfer Virtual Account", @"Convenience Store", @"Internet Banking", @"Personal Financing" ];
    self.sectionItems = @[ @[@""],
                           @[@""],
                           @[@"Mandiri", @"Mandiri Syariah"],
                           @[@""],
                           @[@""],
                           @[@""]
                         ];
    
    self.tableViewAccordion.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.tableViewAccordion.rowHeight = UITableViewAutomaticDimension;
    self.tableViewAccordion.estimatedRowHeight = 100;
    self.expandedSectionHeaderNumber = -1;
}

- (void)SubmitTapped:(id)sender {
    NSString *dataClientId = self.settingPageViewController.textFieldClientId.text;
    NSString *dataMerchantName = self.settingPageViewController.textFieldMerchantName.text;
    NSString *dataSharedKey = self.settingPageViewController.textFieldSharedkey.text;
    NSString *dataEnvironmentServer = self.settingPageViewController.textFieldEnvironmentServer.text;
    NSString *dataActivePageResult = self.settingPageViewController.textFieldActiveResultPage.text;
    
    [DokuUtils saveValueAtNSUserDefault:dataClientId forKey:clientId];
    [DokuUtils saveValueAtNSUserDefault:dataMerchantName forKey:merchantName];
    [DokuUtils saveValueAtNSUserDefault:dataSharedKey forKey:sharedKey];
    [DokuUtils saveValueAtNSUserDefault:dataEnvironmentServer forKey:environmentServer];
    [DokuUtils saveValueAtNSUserDefault:dataActivePageResult forKey:activePageResult];
}

 -(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"SET" style: UIBarButtonItemStyleDone target:self action:@selector(ActionSet)];
    self.navigationItem.rightBarButtonItem = rightButton;
}

- (IBAction)ActionSet
{
    self.settingPageViewController = [[SettingPageViewController alloc] init];
    [self.settingPageViewController.buttonSubmit addTarget:self action:@selector(SubmitTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.settingPageViewController show];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    if (self.sectionNames.count > 0) {
        self.tableViewAccordion.backgroundView = nil;
        return self.sectionNames.count;
    } else {
        UILabel *messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
        
        messageLabel.text = @"Retrieving data.\nPlease wait.";
        messageLabel.numberOfLines = 0;
        messageLabel.textAlignment = NSTextAlignmentCenter;
        messageLabel.font = [UIFont fontWithName:@"Helvetica Neue" size:20];
        [messageLabel sizeToFit];
        self.tableViewAccordion.backgroundView = messageLabel;
        
        return 0;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.expandedSectionHeaderNumber == section) {
        NSMutableArray *arrayOfItems = [self.sectionItems objectAtIndex:section];
        return arrayOfItems.count;
    } else {
        return 0;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (self.sectionNames.count) {
        return [self.sectionNames objectAtIndex:section];
    }
    
    return @"";
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section; {
    return 44.0;
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section {
    // recast your view as a UITableViewHeaderFooterView
    UITableViewHeaderFooterView *header = (UITableViewHeaderFooterView *)view;
    header.contentView.backgroundColor = [UIColor whiteColor];
    header.textLabel.textColor = [UIColor grayColor];
    UIImageView *viewWithTag = [self.view viewWithTag:kHeaderSectionTag + section];
    if (viewWithTag) {
        [viewWithTag removeFromSuperview];
    }
    // add the arrow image
    CGSize headerFrame = self.view.frame.size;
    UIImageView *theImageView = [[UIImageView alloc] initWithFrame:CGRectMake(headerFrame.width - 32, 13, 18, 18)];
    theImageView.image = [UIImage imageNamed:@"Chevron-Dn-Wht"];
    theImageView.tag = kHeaderSectionTag + section;
    [header addSubview:theImageView];
    
    // make headers touchable
    header.tag = section;
    UITapGestureRecognizer *headerTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sectionHeaderWasTouched:)];
    [header addGestureRecognizer:headerTapGesture];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tableCell" forIndexPath:indexPath];
    NSArray *section = [self.sectionItems objectAtIndex:indexPath.section];
    
    cell.textLabel.textColor = [UIColor blackColor];
    cell.textLabel.text = [section objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSArray *section = [self.sectionItems objectAtIndex:indexPath.section];
    NSString * menu = [section objectAtIndex:indexPath.row];
    
    if ([menu isEqualToString:@"Mandiri"]) {
        self.channelCode = MandiriVa;
    } else if ([menu isEqualToString:@"Mandiri Syariah"]) {
        self.channelCode = MandiriSyariahVa;
    }
    
    NSString *getClientId = [DokuUtils getValueFromNSUserDefaultForKey:clientId];
    NSString *getMerchantName = [DokuUtils getValueFromNSUserDefaultForKey:merchantName];
    NSString *getSharedKey = [DokuUtils getValueFromNSUserDefaultForKey:sharedKey];
    
    
    NSString *getEnvironmentServer = [DokuUtils getValueFromNSUserDefaultForKey:environmentServer];
    NSString * getValueEnvironmentServer;
    if ([getEnvironmentServer isEqualToString: @"SandBox"]) {
        getValueEnvironmentServer = @"no";
    } else if ([getEnvironmentServer isEqualToString: @"Production"]) {
        getValueEnvironmentServer = @"yes";
    }
    
    NSString *getActivePageResult = [DokuUtils getValueFromNSUserDefaultForKey:activePageResult];
    NSString * getValueActivePageResult;
    if ([getActivePageResult isEqualToString: @"YES"]) {
        getValueActivePageResult = @"yes";
    } else if ([getActivePageResult isEqualToString: @"NO"]) {
        getValueActivePageResult = @"no";
    }
    
    NSString * email = @"demosdk@doku.com";
    NSString * name = @"demosdk";
    NSString * amount = @"10000";
    NSString * expiredTime = @"60";
    NSString * reusableStatus = @"false";
    NSString * invoiceNumber = [NSString stringWithFormat:@"%@%@",@"DEMOSDK-", [DokuUtils getRandomInvoiceNumbertring:10]];
    NSString * dataWords = [NSString stringWithFormat:@"%@%@%@%@%@%@%@%@", getClientId, email, name, amount, invoiceNumber, expiredTime, reusableStatus, getSharedKey];
    
    NSString * Words = [DokuUtils sha256HashFor: dataWords];
    
    DokuPaySdk *doku = [DokuPaySdk sharedInstance];
    [doku connectVa:(int) self.channelCode
           clientId: getClientId
       merchantName: getMerchantName
      customerEmail: email
       customerName: name
         dataAmount: amount
          dataWords: Words
        expiredTime: expiredTime
      invoiceNumber: invoiceNumber
       isProduction: getValueEnvironmentServer
     reusableStatus: reusableStatus
      usePageResult: getValueActivePageResult];
}

- (void)updateTableViewRowDisplay:(NSArray *)arrayOfIndexPaths {
    [self.tableViewAccordion beginUpdates];
    [self.tableViewAccordion deleteRowsAtIndexPaths:arrayOfIndexPaths withRowAnimation: UITableViewRowAnimationFade];
    [self.tableViewAccordion endUpdates];
}

#pragma mark - Expand / Collapse Methods

- (void)sectionHeaderWasTouched:(UITapGestureRecognizer *)sender {
    UITableViewHeaderFooterView *headerView = (UITableViewHeaderFooterView *)sender.view;
    NSInteger section = headerView.tag;
    UIImageView *eImageView = (UIImageView *)[headerView viewWithTag:kHeaderSectionTag + section];
    self.expandedSectionHeader = headerView;
    
    if (self.expandedSectionHeaderNumber == -1) {
        self.expandedSectionHeaderNumber = section;
        [self tableViewExpandSection:section withImage: eImageView];
    } else {
        if (self.expandedSectionHeaderNumber == section) {
            [self tableViewCollapeSection:section withImage: eImageView];
            self.expandedSectionHeader = nil;
        } else {
            UIImageView *cImageView  = (UIImageView *)[self.view viewWithTag:kHeaderSectionTag + self.expandedSectionHeaderNumber];
            [self tableViewCollapeSection:self.expandedSectionHeaderNumber withImage: cImageView];
            [self tableViewExpandSection:section withImage: eImageView];
        }
    }
}

- (void)tableViewCollapeSection:(NSInteger)section withImage:(UIImageView *)imageView {
    NSArray *sectionData = [self.sectionItems objectAtIndex:section];
    
    self.expandedSectionHeaderNumber = -1;
    if (sectionData.count == 0) {
        return;
    } else {
        [UIView animateWithDuration:0.4 animations:^{
            imageView.transform = CGAffineTransformMakeRotation((0.0 * M_PI) / 180.0);
        }];
        NSMutableArray *arrayOfIndexPaths = [NSMutableArray array];
        for (int i=0; i< sectionData.count; i++) {
            NSIndexPath *index = [NSIndexPath indexPathForRow:i inSection:section];
            [arrayOfIndexPaths addObject:index];
        }
        [self.tableViewAccordion beginUpdates];
        [self.tableViewAccordion deleteRowsAtIndexPaths:arrayOfIndexPaths withRowAnimation: UITableViewRowAnimationFade];
        [self.tableViewAccordion endUpdates];
    }
}

- (void)tableViewExpandSection:(NSInteger)section withImage:(UIImageView *)imageView {
    NSArray *sectionData = [self.sectionItems objectAtIndex:section];
    
    if (sectionData.count == 0) {
        self.expandedSectionHeaderNumber = -1;
        return;
    } else {
        [UIView animateWithDuration:0.4 animations:^{
            imageView.transform = CGAffineTransformMakeRotation((180.0 * M_PI) / 180.0);
        }];
        NSMutableArray *arrayOfIndexPaths = [NSMutableArray array];
        for (int i=0; i< sectionData.count; i++) {
            NSIndexPath *index = [NSIndexPath indexPathForRow:i inSection:section];
            [arrayOfIndexPaths addObject:index];
        }
        self.expandedSectionHeaderNumber = section;
        [self.tableViewAccordion beginUpdates];
        [self.tableViewAccordion insertRowsAtIndexPaths:arrayOfIndexPaths withRowAnimation: UITableViewRowAnimationFade];
        [self.tableViewAccordion endUpdates];
    }
}


@end
