//
//  ListViewCellTableViewCell.h
//  DokuPayDemo
//
//  Created by Dedye on 08/07/20.
//  Copyright © 2020 Doku. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ListViewCellTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *labelViewTitleMenu;

@property (weak, nonatomic) IBOutlet UIImageView *imageViewIconMenu;

@end

NS_ASSUME_NONNULL_END
