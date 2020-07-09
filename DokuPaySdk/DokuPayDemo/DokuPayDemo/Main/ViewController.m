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
#import "DokuUtils.h"
#import "DokuConstants.h"
#import "ResultPageDemoViewController.h"
#import "ListViewCellTableViewCell.h"
#import "TableViewHeaderCell.h"
#import "STPopup.h"
#import "BottomSheetViewController.h"
#import "DokuStyle.h"
#import "UIColor+DokuColor.h"
#import "UIFont+DokuFont.h"
#import "AppDelegate.h"

@interface ViewController () <DokuPaySdkDelegate>

@property (assign) NSInteger expandedSectionHeaderNumber;
@property (assign) TableViewHeaderCell * expandedSectionHeader;
@property (strong) NSArray * sectionItems;
@property (strong) NSArray * sectionItemsImages;
@property (strong) NSArray * sectionNames;
@property (strong) NSArray * sectionNamesImages;
@property (nonatomic, copy) NSString * invoiceNumber;
@property (strong, nonatomic) SettingPageViewController * settingPageViewController;
@property (weak, nonatomic) IBOutlet UITableView * tableViewAccordion;
@property (weak, nonatomic) IBOutlet UILabel * labelViewOrderId;
@property (weak, nonatomic) IBOutlet UILabel * labelViewAmount;
@property (nonatomic,strong) NSString * dataResponse;
@property (nonatomic,strong) NSString * amount;
@property (nonatomic,strong) NSString * merchantName;
@property (weak, nonatomic) IBOutlet UIView * viewOrder;
@property (weak, nonatomic) IBOutlet UIButton * buttonDetails;
@property (strong, nonatomic) IBOutlet UIView *viewMain;
@property (weak, nonatomic) IBOutlet UIView *viewPowerBy;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.sectionNames = @[ @"Credit Card",
                           @"E-Money",
                           @"Transfer Virtual Account",
                           @"Convenience Store",
                           @"Internet Banking",
                           @"Personal Financing"];
    
    self.sectionNamesImages = @[ @"icon_cc",
                                 @"icon_emoney",
                                 @"icon_transfer_va",
                                 @"icon_convenience_store",
                                 @"icon_internet_banking",
                                 @"icon_personal_financing"];
    
    self.sectionItems = @[ @[@" "],
                           @[@" "],
                           @[@"Mandiri", @"Mandiri Syariah"],
                           @[@" "],
                           @[@" "],
                           @[@" "]];
    
    self.sectionItemsImages = @[ @[@" "],
                                 @[@" "],
                                 @[@"icon_mandiri", @"icon_mandiri_syariah"],
                                 @[@" "],
                                 @[@" "],
                                 @[@" "]];
    
    self.tableViewAccordion.tableFooterView = [[UIView alloc] initWithFrame: CGRectZero];
    [self.tableViewAccordion registerNib: [UINib nibWithNibName:@"TableViewHeaderCell"
                                                         bundle:nil]
                  forCellReuseIdentifier: @"HeaderCell"];
    
    self.tableViewAccordion.rowHeight = UITableViewAutomaticDimension;
    self.tableViewAccordion.estimatedRowHeight = 100;
    self.expandedSectionHeaderNumber = -1;
    
    [self setupForm];
    
}

- (IBAction)buttonDetails:(id)sender {
    
    STPopupController *popupController = [[STPopupController alloc]
                                          initWithRootViewController: [[UIStoryboard storyboardWithName: @"BottomSheetViewControllerStoryboard"
                                                                                                 bundle: nil]
                                                                       instantiateViewControllerWithIdentifier: @"BottomSheetViewController"]];
    popupController.style = STPopupStyleBottomSheet;
    popupController.navigationBarHidden = true;
    [popupController.backgroundView addGestureRecognizer: [[UITapGestureRecognizer alloc] initWithTarget: self
                                                                                                  action: @selector(handleSingleTap:)]];
    [popupController presentInViewController: self];
    
}

- (void) setupForm {
    [DokuStyle DokuButonRoundedTopLeftRight: self.buttonDetails];
    
    self.viewOrder.layer.borderWidth = 1;
    self.viewOrder.layer.cornerRadius = 10;
    self.viewOrder.layer.borderColor = [UIColor dokuSeparator].CGColor;
    
    self.viewPowerBy.layer.borderWidth = 1;
    self.viewPowerBy.layer.cornerRadius = 10;
    self.viewPowerBy.layer.borderColor = [UIColor dokuSeparator].CGColor;
    
    self.tableViewAccordion.layer.borderWidth = 1;
    self.tableViewAccordion.layer.cornerRadius = 10;
    self.tableViewAccordion.layer.borderColor = [UIColor dokuSeparator].CGColor;
    
}

- (void)handleSingleTap: (UITapGestureRecognizer *)recognizer {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) setTitle {
    NSString *getMerchantName = [DokuUtils getValueFromNSUserDefaultForKey: merchantName];
    self.navigationController.navigationBar.topItem.title = getMerchantName;
}

- (void) alert: (NSString *) message {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle: @"Info"
                                                                   message: message
                                                            preferredStyle: UIAlertControllerStyleAlert];
    
    UIAlertAction *ok = [UIAlertAction actionWithTitle: @"OK"
                                                 style: UIAlertActionStyleDefault
                                               handler: ^(UIAlertAction * _Nonnull action) {
        [self dismissViewControllerAnimated: YES
                                 completion: nil];
    }];

    [alert addAction:ok];
    [self presentViewController: alert
                       animated: YES
                     completion: nil];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear: animated];
    [self setTitle];
}

- (void)viewWillAppear: (BOOL)animated {
    [super viewWillAppear: animated];
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle: @"SET"
                                                                    style: UIBarButtonItemStyleDone
                                                                   target: self
                                                                   action: @selector(actionSet)];
    [rightButton setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys: [UIFont dokuDINNextLTProMediumFontWithSize: 14.0],
                                          NSFontAttributeName,
                                          [UIColor blackColor],
                                          NSForegroundColorAttributeName, nil]
                               forState: UIControlStateNormal];
    
    self.navigationItem.rightBarButtonItem = rightButton;
    
    UIImage *leftImage = [[UIImage imageNamed:@"CloseAlert.png"] imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithImage: leftImage
                                                                   style: UIBarButtonItemStylePlain
                                                                  target: self
                                                                  action: @selector(actionClose)];
    
    self.navigationItem.leftBarButtonItem = leftButton;
    
    self.invoiceNumber = [NSString stringWithFormat:@"%@%@",@"DEMOSDK-", [DokuUtils getRandomInvoiceNumbertring: 10]];
    NSString * createInvoice = [NSString stringWithFormat:@"%@%@",@"Order ID : ", self.invoiceNumber ];
    [self.labelViewOrderId setText: createInvoice];
    [self setTitle];
}

- (IBAction)actionClose {
    NSLog(@"Close Form");
}

- (IBAction)actionSet {
    STPopupController *popupController = [[STPopupController alloc]
                                          initWithRootViewController: [[UIStoryboard storyboardWithName: @"SettingPageViewControllerStoryboard"
                                                                                                 bundle: nil]
                                                                       instantiateViewControllerWithIdentifier: @"SettingPageViewController"]];
    [popupController.backgroundView addGestureRecognizer: [[UITapGestureRecognizer alloc] initWithTarget: self
    action: @selector(handleSingleTap:)]];
    popupController.navigationBarHidden = true;
    [popupController presentInViewController: self];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView: (UITableView *)tableView {
    if (self.sectionNames.count > 0) {
        self.tableViewAccordion.backgroundView = nil;
        return self.sectionNames.count;
    } else {
        UILabel *messageLabel = [[UILabel alloc] initWithFrame: CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
        
        messageLabel.text = @"Retrieving data.\nPlease wait.";
        messageLabel.numberOfLines = 0;
        messageLabel.textAlignment = NSTextAlignmentCenter;
        messageLabel.font = [UIFont dokuDINNextLTProRegularFontWithSize: 20];
        [messageLabel sizeToFit];
        self.tableViewAccordion.backgroundView = messageLabel;
        
        return 0;
    }
}

- (NSInteger)tableView: (UITableView *)tableView
 numberOfRowsInSection: (NSInteger)section {
    
    if (self.expandedSectionHeaderNumber == section) {
        NSMutableArray *arrayOfItems = [self.sectionItems objectAtIndex: section];
        return arrayOfItems.count;
    } else {
        return 0;
    }
}

- (NSString *)tableView: (UITableView *)tableView
titleForHeaderInSection: (NSInteger)section {
    if (self.sectionNames.count) {
        return [self.sectionNames objectAtIndex: section];
    }
    
    return @"";
}

- (CGFloat)tableView: (UITableView *)tableView
heightForHeaderInSection: (NSInteger)section; {
    return 55.0;
}

- (CGFloat)tableView: (UITableView *)tableView
heightForRowAtIndexPath: (NSIndexPath *)indexPath {
    return 53;
}

- (UIView*) tableView: (UITableView*) tableView viewForHeaderInSection: (NSInteger) section
{
    TableViewHeaderCell *cellHeader = [tableView dequeueReusableCellWithIdentifier: @"HeaderCell"];
    NSString *headerTitle = [self.sectionNames objectAtIndex: section];
    NSString *sectionHeaderImage = [self.sectionNamesImages objectAtIndex: section];
   
    UIImage *image = [UIImage imageNamed: sectionHeaderImage
                                inBundle: [NSBundle bundleForClass:self.class] compatibleWithTraitCollection:nil];
    
    cellHeader.labelViewTItle.text = headerTitle;
    
    [cellHeader.imageViewIcon setImage: image];
    
    cellHeader.contentView.tag = section;
    UITapGestureRecognizer *headerTapGesture = [[UITapGestureRecognizer alloc] initWithTarget: self
                                                                                       action: @selector(sectionHeaderWasTouched:)];
    [cellHeader.contentView addGestureRecognizer: headerTapGesture];
    
    return cellHeader.contentView;
}

- (UITableViewCell *)tableView: (UITableView *)tableView
         cellForRowAtIndexPath: (NSIndexPath *)indexPath {
    
    ListViewCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"tableCell"
                                                                      forIndexPath: indexPath];
    
    NSArray *section = [self.sectionItems objectAtIndex: indexPath.section];
    NSArray *sectionImage = [self.sectionItemsImages objectAtIndex: indexPath.section];
    
    UIImage *image = [UIImage imageNamed: [sectionImage objectAtIndex: indexPath.row]
                                inBundle: [NSBundle bundleForClass: self.class]compatibleWithTraitCollection: nil];
    
    cell.labelViewTitleMenu.text = [section objectAtIndex: indexPath.row];
    
    [cell.imageViewIconMenu setImage: image];
    
    return cell;
}

- (void)tableView: (UITableView *)tableView
didSelectRowAtIndexPath: (NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath: indexPath
                             animated: YES];
    
    NSArray *section = [self.sectionItems objectAtIndex: indexPath.section];
    NSString * menu = [section objectAtIndex: indexPath.row];
    
    if ([menu isEqualToString: @"Mandiri"]) {
        self.channelCode = MandiriVa;
    } else if ([menu isEqualToString: @"Mandiri Syariah"]) {
        self.channelCode = MandiriSyariahVa;
    }
    
    NSString *getClientId = [DokuUtils getValueFromNSUserDefaultForKey: clientId];
    NSString *getMerchantName = [DokuUtils getValueFromNSUserDefaultForKey: merchantName];
    
    self.merchantName = getMerchantName;
    NSString *getSharedKey = [DokuUtils getValueFromNSUserDefaultForKey: sharedKey];
    
    NSString *getEnvironmentServer = [DokuUtils getValueFromNSUserDefaultForKey: environmentServer];
    NSString *getValueEnvironmentServer;
    
    if (getClientId != nil) {
    
        if ([getEnvironmentServer isEqualToString: @"SandBox"]) {
            getValueEnvironmentServer = @"no";
        } else if ([getEnvironmentServer isEqualToString: @"Production"]) {
            getValueEnvironmentServer = @"yes";
        }
        
        NSString *getActivePageResult = [DokuUtils getValueFromNSUserDefaultForKey: activePageResult];
        NSString * getValueActivePageResult;
        if ([getActivePageResult isEqualToString: @"YES"]) {
            getValueActivePageResult = @"yes";
        } else if ([getActivePageResult isEqualToString: @"NO"]) {
            getValueActivePageResult = @"no";
        }
        
        NSString *email = @"demosdk@doku.com";
        NSString *name = @"demosdk";
        NSString *amount = @"10000";
        self.amount = amount;
        NSString *expiredTime = @"60";
        NSString *reusableStatus = @"false";
        NSString *dataWords = [NSString
                               stringWithFormat:@"%@%@%@%@%@%@%@%@",
                               getClientId,
                               email,
                               name,
                               amount,
                               self.invoiceNumber,
                               expiredTime,
                               reusableStatus,
                               getSharedKey];
        
        NSString * Words = [DokuUtils sha256HashFor: dataWords];
        
        DokuPaySdk *doku = [DokuPaySdk sharedInstance];
        [doku connectVa: self
         paymentChannel: (int) self.channelCode
               clientId: getClientId
           merchantName: getMerchantName
          customerEmail: email
           customerName: name
             dataAmount: amount
              dataWords: Words
            expiredTime: expiredTime
          invoiceNumber: self.invoiceNumber
           isProduction: getValueEnvironmentServer
         reusableStatus: reusableStatus
          usePageResult: getValueActivePageResult];
    } else {
        [self alert: @"Please Setting Credential !"];
    }
}

#pragma mark - Expand / Collapse Methods

- (void)sectionHeaderWasTouched: (UITapGestureRecognizer *)sender {
    UIImageView *eImageViewOld = (UIImageView *)[self.expandedSectionHeader viewWithTag: 200];
    [self removeArrowIcon: eImageViewOld];
    TableViewHeaderCell *headerView = (TableViewHeaderCell *)sender.view;
    NSInteger section = headerView.tag;
    UIImageView *eImageView = (UIImageView *)[headerView viewWithTag: 200];
    self.expandedSectionHeader = headerView;
    
    if (self.expandedSectionHeaderNumber == -1) {
        self.expandedSectionHeaderNumber = section;
        [self tableViewExpandSection: section
                           withImage: eImageView];
    } else {
        if (self.expandedSectionHeaderNumber == section) {
            [self tableViewCollapeSection: section
                                withImage: eImageView];
            self.expandedSectionHeader = nil;
        } else {
            [self tableViewCollapeSection: self.expandedSectionHeaderNumber
                                withImage: eImageView];
            [self tableViewExpandSection: section
                               withImage: eImageView];
        }
    }
}

- (void) removeArrowIcon:(UIImageView *)imageView {
    [UIView animateWithDuration: 0.4
                     animations: ^ {
        imageView.transform = CGAffineTransformMakeRotation((0.0 * M_PI) / 180.0);
    }];
}

- (void)tableViewCollapeSection: (NSInteger)section
                      withImage: (UIImageView *)imageView {
    NSArray *sectionData = [self.sectionItems objectAtIndex: section];
    
    self.expandedSectionHeaderNumber = -1;
    if (sectionData.count == 0) {
        return;
    } else {
        [UIView animateWithDuration: 0.4
                         animations: ^ {
            imageView.transform = CGAffineTransformMakeRotation((0.0 * M_PI) / 180.0);
        }];
        
        NSMutableArray *arrayOfIndexPaths = [NSMutableArray array];
        for (int i=0; i< sectionData.count; i++) {
            NSIndexPath *index = [NSIndexPath indexPathForRow: i
                                                    inSection: section];
            [arrayOfIndexPaths addObject: index];
        }
        [self.tableViewAccordion beginUpdates];
        [self.tableViewAccordion deleteRowsAtIndexPaths: arrayOfIndexPaths
                                       withRowAnimation: UITableViewRowAnimationFade];
        [self.tableViewAccordion endUpdates];
    }
}

- (void)tableViewExpandSection: (NSInteger)section
                     withImage: (UIImageView *)imageView {
    NSArray *sectionData = [self.sectionItems objectAtIndex: section];
    
    if (sectionData.count == 0) {
        self.expandedSectionHeaderNumber = -1;
        return;
    } else {
        [UIView animateWithDuration: 0.4
                         animations: ^ {
            imageView.transform = CGAffineTransformMakeRotation((180.0 * M_PI) / 180.0);
        }];
        NSMutableArray *arrayOfIndexPaths = [NSMutableArray array];
        for (int i=0; i< sectionData.count; i++) {
            NSIndexPath *index = [NSIndexPath indexPathForRow: i
                                                    inSection: section];
            [arrayOfIndexPaths addObject: index];
        }
        
        self.expandedSectionHeaderNumber = section;
        [self.tableViewAccordion beginUpdates];
        [self.tableViewAccordion insertRowsAtIndexPaths: arrayOfIndexPaths
                                       withRowAnimation: UITableViewRowAnimationFade];
        [self.tableViewAccordion endUpdates];
    }
}

- (void)sendStringBack:(NSString *_Nullable)data {
    self.dataResponse = data;
    [self performSegueWithIdentifier:@"resultPageSegue" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"resultPageSegue"]) {
        ResultPageDemoViewController *resultPageViewController = segue.destinationViewController;
        resultPageViewController.dataResponse = self.dataResponse;
        resultPageViewController.amount = self.amount;
        resultPageViewController.channelId = (int) self.channelCode;
        resultPageViewController.merchantName = self.merchantName;
    }
}

@end
