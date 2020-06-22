//
//  ViewController.h
//  DokuPayDemo
//
//  Created by Dedye on 12/06/20.
//  Copyright © 2020 Doku. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ChannelCode) {
    MandiriVa = 1,
    MandiriSyariahVa = 2 
};

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (assign, nonatomic) ChannelCode channelCode;

@end

