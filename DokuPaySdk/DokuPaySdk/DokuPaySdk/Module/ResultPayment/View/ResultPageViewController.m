//
//  ResultPageViewController.m
//  DokuPaySdk
//
//  Created by Dedye on 22/06/20.
//  Copyright © 2020 Doku. All rights reserved.
//

#import "ResultPageViewController.h"
#import "DokuPayUtils.h"
#import "MandiriVaHowToInstruction.h"
#import "MandiriVaHowToInstruction.h"
#import <DokuPaySdk/DokuPaySdk.h>
#import "UIFont+DokuFont.h"
#import "UIColor+DokuColor.h"
#import "TableHeaderCell.h"
#import "DokuStyle.h"
#import "STPopup.h"

@interface ResultPageViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableViewInstruction;
@property (weak, nonatomic) IBOutlet UILabel *labelViewOrder;
@property (weak, nonatomic) IBOutlet UILabel *labelViewAmount;
@property (weak, nonatomic) IBOutlet UILabel *labelViewVaChannel;
@property (weak, nonatomic) IBOutlet UILabel *labelViewVaNumber;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewLogoChannel;
@property (assign) NSInteger expandedSectionHeaderNumber;
@property (assign) TableHeaderCell *expandedSectionHeader;
@property (strong) NSArray *sectionItems;
@property (strong) NSArray *sectionNames;
@property (weak, nonatomic) IBOutlet UIView *viewOrder;
@property (weak, nonatomic) IBOutlet UIButton *buttonDetails;
@property (weak, nonatomic) IBOutlet UIView *viewTransfer;
@property (weak, nonatomic) IBOutlet UIView *viewPowerBy;

@end

@implementation ResultPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableViewInstruction.tableFooterView = [[UIView alloc] initWithFrame: CGRectZero];
    [self.tableViewInstruction registerNib: [UINib nibWithNibName:@"TableHeaderCell"
                                           bundle:[NSBundle bundleForClass:self.class]]
    forCellReuseIdentifier: @"HeaderCell"];
    self.tableViewInstruction.rowHeight = UITableViewAutomaticDimension;
    self.tableViewInstruction.estimatedRowHeight = 100;
    self.expandedSectionHeaderNumber = -1;
    [self.presenter initData];
    [self setupForm];
}

- (void) setupForm {
    [DokuStyle DokuButonRoundedTopLeftRight: self.buttonDetails];
    
    self.viewOrder.layer.borderWidth = 1;
    self.viewOrder.layer.cornerRadius = 10;
    self.viewOrder.layer.borderColor = [UIColor dokuSeparator].CGColor;
    
    self.tableViewInstruction.layer.borderWidth = 1;
    self.tableViewInstruction.layer.cornerRadius = 10;
    self.tableViewInstruction.layer.borderColor = [UIColor dokuSeparator].CGColor;
    
    self.viewTransfer.layer.borderWidth = 1;
    self.viewTransfer.layer.cornerRadius = 10;
    self.viewTransfer.layer.borderColor = [UIColor dokuSeparator].CGColor;
    
    self.viewPowerBy.layer.borderWidth = 1;
    self.viewPowerBy.layer.cornerRadius = 10;
    self.viewPowerBy.layer.borderColor = [UIColor dokuSeparator].CGColor;
    
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

- (IBAction)buttonChangePayment:(id)sender {
    UIViewController *viewController = self.presentingViewController;
    while (viewController.presentingViewController) {
        viewController = viewController.presentingViewController;
    }
    [viewController dismissViewControllerAnimated: YES
                                       completion: NULL];}

- (void)viewWillAppear: (BOOL)animated {
    [super viewWillAppear: animated];
    UIImage *rightImage = [[UIImage imageNamed:@"icon_close" inBundle: [NSBundle bundleForClass:self.class]
    compatibleWithTraitCollection:nil] imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithImage: rightImage
                                                                    style: UIBarButtonItemStylePlain
                                                                   target: self
                                                                   action: @selector(actionClose)];
    
    self.navigationItem.rightBarButtonItem = rightButton;
    [self.navigationController.navigationBar setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys: [UIColor dokuBaseText],
                                                                      NSForegroundColorAttributeName,
                                                                      [UIFont dokuRobotoBoldFontWithSize: 18],
                                                                      NSFontAttributeName,nil]];
    [self.navigationController.navigationBar setBarTintColor: [UIColor whiteColor]];
}

- (IBAction)buttonClose:(id)sender {
    UIViewController *viewController = self.presentingViewController;
    while (viewController.presentingViewController) {
        viewController = viewController.presentingViewController;
    }
    [viewController dismissViewControllerAnimated: YES
                                       completion: NULL];
}

- (IBAction)actionClose {
    UIViewController *viewController = self.presentingViewController;
    while (viewController.presentingViewController) {
        viewController = viewController.presentingViewController;
    }
    [viewController dismissViewControllerAnimated: YES
                                       completion: NULL];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    if (self.sectionNames.count > 0) {
        self.tableViewInstruction.backgroundView = nil;
        return self.sectionNames.count;
    } else {
        UILabel *messageLabel = [[UILabel alloc] initWithFrame: CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
        
        messageLabel.text = @"Retrieving data.\nPlease wait.";
        messageLabel.numberOfLines = 0;
        messageLabel.textAlignment = NSTextAlignmentCenter;
        messageLabel.font = [UIFont dokuDINNextLTProRegularFontWithSize: 20];
        [messageLabel sizeToFit];
        self.tableViewInstruction.backgroundView = messageLabel;
        
        return 0;
    }
}

- (NSInteger)tableView: (UITableView *)tableView numberOfRowsInSection: (NSInteger)section {
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
    TableHeaderCell *cellHeader = [tableView dequeueReusableCellWithIdentifier: @"HeaderCell"];
    NSString *headerTitle = [self.sectionNames objectAtIndex: section];
    
    cellHeader.labelViewTitle.text = headerTitle;
    
    cellHeader.contentView.tag = section;
    UITapGestureRecognizer *headerTapGesture = [[UITapGestureRecognizer alloc] initWithTarget: self
                                                                                       action: @selector(sectionHeaderWasTouched:)];
    [cellHeader.contentView addGestureRecognizer: headerTapGesture];
    
    return cellHeader.contentView;
}

- (UITableViewCell *)tableView: (UITableView *)tableView
         cellForRowAtIndexPath: (NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"tableCell"
                                                            forIndexPath: indexPath];
    NSArray *section = [self.sectionItems objectAtIndex: indexPath.section];
    
    cell.textLabel.textColor = [UIColor blackColor];
    cell.textLabel.text = [section objectAtIndex: indexPath.row];
    
    return cell;
}

- (void)tableView: (UITableView *)tableView
didSelectRowAtIndexPath: (NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath: indexPath animated:YES];
}

- (void)updateTableViewRowDisplay: (NSArray *)arrayOfIndexPaths {
    [self.tableViewInstruction beginUpdates];
    [self.tableViewInstruction deleteRowsAtIndexPaths: arrayOfIndexPaths
                                     withRowAnimation: UITableViewRowAnimationFade];
    [self.tableViewInstruction endUpdates];
}

#pragma mark - Expand / Collapse Methods

- (void)sectionHeaderWasTouched: (UITapGestureRecognizer *)sender {
    UIImageView *eImageViewOld = (UIImageView *)[self.expandedSectionHeader viewWithTag: 200];
    [self removeArrowIcon: eImageViewOld];
    TableHeaderCell *headerView = (TableHeaderCell *)sender.view;
    NSInteger section = headerView.tag;
    UIImageView *eImageView = (UIImageView *)[headerView viewWithTag: 200];
    NSLog(@"Dedye eImageView %@",eImageView);
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
        [self.tableViewInstruction beginUpdates];
        [self.tableViewInstruction deleteRowsAtIndexPaths: arrayOfIndexPaths
                                       withRowAnimation: UITableViewRowAnimationFade];
        [self.tableViewInstruction endUpdates];
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
        [self.tableViewInstruction beginUpdates];
        [self.tableViewInstruction insertRowsAtIndexPaths: arrayOfIndexPaths
                                       withRowAnimation: UITableViewRowAnimationFade];
        [self.tableViewInstruction endUpdates];
    }
}

- (void)showError:(NSString *)response {
    UIAlertController *alertControl = [DokuPayUtils alertView: response
                                                    withTitle: @"Info"];
    [self presentViewController: alertControl
                       animated: YES
                     completion: nil];
}

- (void)showResponse:(NSString *)item {
    NSLog(@"Result Page show response : %@", item);
    MandiriVaHowToInstruction *data = [[MandiriVaHowToInstruction alloc] initWithData: item];
    
    NSMutableArray *listSectionName = [[NSMutableArray alloc] init];
    NSMutableArray *listSectionItem = [[NSMutableArray alloc] init];
    
    for(NSDictionary *item in data.howToPay) {
        [listSectionName addObject: [item objectForKey:@"channel"]];
        [listSectionItem addObject: [item objectForKey:@"step"]];
    }
    self.sectionNames = listSectionName;
    self.sectionItems = listSectionItem;
    [self.tableViewInstruction reloadData];
}

- (void)initData: (MandiriVaResponse *)data {
    if ([data.channelId isEqualToString: @"1"]) {
        [self.imageViewLogoChannel setImage: [DokuPayUtils getIcon: data.channelId]];
        [self.labelViewVaChannel setText: @"Mandiri"];
    } else if ([data.channelId isEqualToString: @"2"]) {
        [self.imageViewLogoChannel setImage: [DokuPayUtils getIcon: data.channelId]];
        [self.labelViewVaChannel setText: @"Mandiri Syariah"];
    }
    
    self.title = data.merchantName;
    NSString * createInvoice = [NSString stringWithFormat:@"%@%@",@"Order ID : ", data.invoiceNumber];
    [self.labelViewOrder setText: createInvoice];
    [self.labelViewAmount setText: data.amount];
    [self.labelViewVaNumber setText: data.vaNumber];
    [self.presenter getHowToInstruction: data.howToPayApi];
}

@end
