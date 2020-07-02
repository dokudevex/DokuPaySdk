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

static int const kHeaderSectionTag = 6900;

@interface ResultPageViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableViewInstruction;
@property (weak, nonatomic) IBOutlet UILabel *labelViewOrder;
@property (weak, nonatomic) IBOutlet UILabel *labelViewAmount;
@property (weak, nonatomic) IBOutlet UILabel *labelViewVaChannel;
@property (weak, nonatomic) IBOutlet UILabel *labelViewVaNumber;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewLogoChannel;
@property (weak, nonatomic) IBOutlet UILabel *labelViewTitle;
@property (assign) NSInteger expandedSectionHeaderNumber;
@property (assign) UITableViewHeaderFooterView *expandedSectionHeader;
@property (strong) NSArray *sectionItems;
@property (strong) NSArray *sectionNames;

@end

@implementation ResultPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableViewInstruction.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.tableViewInstruction.rowHeight = UITableViewAutomaticDimension;
    self.tableViewInstruction.estimatedRowHeight = 100;
    self.expandedSectionHeaderNumber = -1;
    [self.presenter initData];
}

- (IBAction)buttonClose:(id)sender {
    UIViewController *vc = self.presentingViewController;
    while (vc.presentingViewController) {
        vc = vc.presentingViewController;
    }
    [vc dismissViewControllerAnimated:YES completion:NULL];
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
        messageLabel.font = [UIFont fontWithName: @"Helvetica Neue"
                                            size: 20];
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
        return [self.sectionNames objectAtIndex:section];
    }
    return @"";
}

- (CGFloat)tableView: (UITableView *)tableView
heightForHeaderInSection: (NSInteger)section; {
    
    return 44.0;
}

- (void)tableView:(UITableView *)tableView
willDisplayHeaderView:(UIView *)view
       forSection:(NSInteger)section {
    
    UITableViewHeaderFooterView *header = (UITableViewHeaderFooterView *)view;
    header.contentView.backgroundColor = [UIColor whiteColor];
    header.textLabel.textColor = [UIColor grayColor];
    UIImageView *viewWithTag = [self.view viewWithTag:kHeaderSectionTag + section];
    
    if (viewWithTag) {
        [viewWithTag removeFromSuperview];
    }
    
    CGSize headerFrame = self.view.frame.size;
    UIImageView *theImageView = [[UIImageView alloc] initWithFrame: CGRectMake(headerFrame.width - 32, 13, 18, 18)];
    theImageView.image = [UIImage imageNamed:@"Chevron-Dn-Wht"];
    theImageView.tag = kHeaderSectionTag + section;
    [header addSubview: theImageView];
    
    header.tag = section;
    UITapGestureRecognizer *headerTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                       action:@selector(sectionHeaderWasTouched:)];
    [header addGestureRecognizer:headerTapGesture];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath: (NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"tableCell"
                                                            forIndexPath: indexPath];
    NSArray *section = [self.sectionItems objectAtIndex: indexPath.section];
    
    cell.textLabel.textColor = [UIColor blackColor];
    cell.textLabel.text = [section objectAtIndex: indexPath.row];
    
    return cell;
}

- (void)tableView: (UITableView *)tableView didSelectRowAtIndexPath: (NSIndexPath *)indexPath {
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
    UITableViewHeaderFooterView *headerView = (UITableViewHeaderFooterView *)sender.view;
    NSInteger section = headerView.tag;
    UIImageView *eImageView = (UIImageView *)[headerView viewWithTag: kHeaderSectionTag + section];
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
            
            [self tableViewCollapeSection: self.expandedSectionHeaderNumber
                                withImage: cImageView];
            
            [self tableViewExpandSection: section
                               withImage: eImageView];
        }
    }
}

- (void)tableViewCollapeSection: (NSInteger)section
                      withImage: (UIImageView *)imageView {
    
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
        [UIView animateWithDuration:0.4 animations:^{
            imageView.transform = CGAffineTransformMakeRotation((180.0 * M_PI) / 180.0);
        }];
        NSMutableArray *arrayOfIndexPaths = [NSMutableArray array];
        for (int i=0; i< sectionData.count; i++) {
            NSIndexPath *index = [NSIndexPath indexPathForRow: i
                                                    inSection: section];
            [arrayOfIndexPaths addObject:index];
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
    
    [self.labelViewTitle setText: data.merchantName];
    [self.labelViewOrder setText: data.invoiceNumber];
    [self.labelViewAmount setText: data.amount];
    [self.labelViewVaNumber setText: data.vaNumber];
    [self.presenter getHowToInstruction: data.howToPayApi];
}

@end
