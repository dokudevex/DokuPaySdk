//
//  TableViewHeaderCell.h
//  DokuPayDemo
//
//  Created by Dedye on 08/07/20.
//  Copyright © 2020 Doku. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TableViewHeaderCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageViewIcon;

@property (weak, nonatomic) IBOutlet UILabel *labelViewTItle;

@property (weak, nonatomic) IBOutlet UIImageView *imageViewArrow;

@end

NS_ASSUME_NONNULL_END
