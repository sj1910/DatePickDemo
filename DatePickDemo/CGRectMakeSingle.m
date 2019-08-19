//
//  CGRectMakeSingle.m
//  DatePickDemo
//
//  Created by sino on 2019/8/19.
//  Copyright © 2019年 sino. All rights reserved.
//

#import "CGRectMakeSingle.h"

@implementation CGRectMakeSingle

static CGRectMakeSingle *single = nil;


+ (CGRectMakeSingle *)share
{
    if (single == nil) {
        
        single = [[CGRectMakeSingle alloc] init];
    }
    
    return single;
}


- (void)getXY
{
//    if(MainHeight > 480){

//        self.autoSizeScaleX = [UIScreen mainScreen].bounds.size.width/375;
//
//        self.autoSizeScaleY = [UIScreen mainScreen].bounds.size.height/667;
    
        
    
//    }else{
//
    if (SJ_iPhoneX) {
        
        self.autoSizeScaleX = 1.0;
        
        self.autoSizeScaleY = 1.0;
    } else {
        
        self.autoSizeScaleX = [UIScreen mainScreen].bounds.size.width/375;

        self.autoSizeScaleY = [UIScreen mainScreen].bounds.size.height/667;
    }

//
//    }
}


+ (CGRect)CGRectMakeCustoms:(CGRect)rect
{
    
    CGRect Rect;
    
    Rect.origin.x = rect.origin.x * [CGRectMakeSingle share].autoSizeScaleX;
    
    Rect.origin.y = rect.origin.y * [CGRectMakeSingle share].autoSizeScaleY;
    
    Rect.size.width = rect.size.width * [CGRectMakeSingle share].autoSizeScaleX;
    
    Rect.size.height = rect.size.height * [CGRectMakeSingle share].autoSizeScaleY;
    
    return Rect;
    
}


@end
