//
//  DataPickerViewController.h
//  DatePickDemo
//
//  Created by sino on 2019/8/19.
//  Copyright © 2019年 sino. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChoiceLineQuiteView.h"

@interface DataPickerViewController : UIViewController

@property (nonatomic,strong) ChoiceLineQuiteView *quiteView;
@property (nonatomic ,copy) void (^choice)(NSString *,UIButton *);
- (void)getCurrentDate;

@end

