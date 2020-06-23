//
//  ResultPageViewController.h
//  DokuPaySdk
//
//  Created by Dedye on 22/06/20.
//  Copyright © 2020 Doku. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ResultPagePresenter.h"
#import "ResultPageContract.h"

NS_ASSUME_NONNULL_BEGIN

@interface ResultPageViewController : UIViewController<ToDoResultPageViewProtocol>

@property (nonatomic, nullable) ResultPagePresenter *presenter;

@end

NS_ASSUME_NONNULL_END
