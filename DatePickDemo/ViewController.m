//
//  ViewController.m
//  DatePickDemo
//
//  Created by sino on 2019/8/19.
//  Copyright © 2019年 sino. All rights reserved.
//

#import "ViewController.h"
#import "DataPickerViewController.h"

@interface ViewController ()
@property (nonatomic,strong) DataPickerViewController *datePicker;
@property (nonatomic,strong) UIButton *btn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.btn = [UIButton buttonWithType:(UIButtonTypeSystem)];
    self.btn.frame = CGRectMake(30, 200, 300, 40);
    [self.btn setBackgroundColor:[UIColor orangeColor]];
    [self.btn setTitle:@"日期选择" forState:(UIControlStateNormal)];
    [self.btn addTarget:self action:@selector(pickDate) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:self.btn];
    
}

- (void)pickDate {
    
    
    
    self.datePicker = [[DataPickerViewController alloc] init];
    [windowView addSubview:self.datePicker.view];
    self.datePicker.view.frame = CGRectMake(0,MainHeight, MainWidth,AutoSizeScaleY(367));
    [UIView animateWithDuration:0.35f animations:^{
        self.datePicker.view.frame = CGRectMake(0,MainHeight - AutoSizeScaleY(367), MainWidth,AutoSizeScaleY(367));
    } completion:^(BOOL finished) {
        
    }];
    @WeakObj(self);
    self.datePicker.choice = ^(NSString *text,UIButton *btn){
        @StrongObj(self);
        [self.btn setTitle:text forState:(UIControlStateNormal)];
    };
    
}

@end
