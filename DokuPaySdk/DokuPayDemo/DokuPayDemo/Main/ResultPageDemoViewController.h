//
//  ResultPageDemoViewController.h
//  DokuPayDemo
//
//  Created by Dedye on 02/07/20.
//  Copyright © 2020 Doku. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MandiriVaResponse.h"

NS_ASSUME_NONNULL_BEGIN

@interface ResultPageDemoViewController: UIViewController

@property (nonatomic, strong) NSString *dataResponse;

@property (nonatomic, strong) NSString *amount;

@property (nonatomic, assign) int channelId;

@property (nonatomic, strong) NSString *merchantName;

@end

NS_ASSUME_NONNULL_END
