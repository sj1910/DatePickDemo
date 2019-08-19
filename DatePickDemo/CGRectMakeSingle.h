//
//  CGRectMakeSingle.h
//  DatePickDemo
//
//  Created by sino on 2019/8/19.
//  Copyright © 2019年 sino. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CGRectMakeSingle : NSObject

@property float autoSizeScaleX;

@property float autoSizeScaleY;

+ (CGRectMakeSingle *)share;

- (void)getXY;

+ (CGRect)CGRectMakeCustoms:(CGRect)rect;

@end
