//
//  DatePickHeader.h
//  DatePickDemo
//
//  Created by sino on 2019/8/19.
//  Copyright © 2019年 sino. All rights reserved.
//

#ifndef DatePickHeader_h
#define DatePickHeader_h

#import <Masonry/Masonry.h>
#import "CGRectMakeSingle.h"
#import "UILabel+Text.h"
#import "UIButton+Text.h"

#define windowView  [UIApplication sharedApplication].keyWindow
#define Font(size) [UIFont systemFontOfSize:AutoSizeScaleX(size)]

#define RGBOF(rgbValue)     [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 \
alpha:1.0]

#define RGBA_OF(rgbValue)   [UIColor colorWithRed:((float)(((rgbValue) & 0xFF000000) >> 24))/255.0 \
green:((float)(((rgbValue) & 0x00FF0000) >> 16))/255.0 \
blue:((float)(rgbValue & 0x0000FF00) >> 8)/255.0 \
alpha:((float)(rgbValue & 0x000000FF))/255.0]

#define RGBAOF(v, a)        [UIColor colorWithRed:((float)(((v) & 0xFF0000) >> 16))/255.0 \
green:((float)(((v) & 0x00FF00) >> 8))/255.0 \
blue:((float)(v & 0x0000FF))/255.0 \
alpha:a]

#define AutoSizeScaleX(x) [CGRectMakeSingle share].autoSizeScaleX * x
#define AutoSizeScaleY(y) [CGRectMakeSingle share].autoSizeScaleY * y

//当前屏幕长、宽
#define MainWidth [UIScreen mainScreen].bounds.size.width
#define MainHeight [UIScreen mainScreen].bounds.size.height

// Status bar height.
#define  SJ_StatusBarHeight ([[UIApplication sharedApplication] statusBarFrame].size.height)

#define SJ_LoginUserInfoModel [[ArchiverManager sharedInstance] unArchiverModel]

// iPhone X
#define  SJ_iPhoneX (SJ_StatusBarHeight > 20)

// navigation bar height.

#define  SJ_StatusBarAndNavigationBarHeight  (SJ_StatusBarHeight + 44.f)

#define  SJ_TabbarSafeBottomMargin  (SJ_iPhoneX ? 34.f : 0.f)


#define WeakObj(o) try{}@finally{} __weak typeof(o) o##Weak = o

#define StrongObj(o) try{}@finally{}  __strong typeof(o) o = o##Weak


#define RGB(r,g,b)          [UIColor colorWithRed:(r)/255.f \
green:(g)/255.f \
blue:(b)/255.f \
alpha:1.f]

#define RGBA(r,g,b,a)       [UIColor colorWithRed:(r)/255.f \
green:(g)/255.f \
blue:(b)/255.f \
alpha:(a)]


// 定义通用颜色
#define kBlackColor             [UIColor blackColor]
#define kDarkGrayColor          [UIColor darkGrayColor]
#define kLightGrayColor         [UIColor lightGrayColor]
#define kWhiteColor             [UIColor whiteColor]
#define kGrayColor              [UIColor grayColor]
#define kRedColor               [UIColor redColor]
#define kGreenColor             [UIColor greenColor]
#define kBlueColor              [UIColor blueColor]
#define kCyanColor              [UIColor cyanColor]
#define kYellowColor            [UIColor yellowColor]
#define kMagentaColor           [UIColor magentaColor]
#define kOrangeColor            [UIColor orangeColor]
#define kPurpleColor            [UIColor purpleColor]
#define kClearColor             [UIColor clearColor]

#define kRandomFlatColor        [UIColor randomFlatColor]

// 默认蓝色
#define kBaseBlueColor          RGB(27, 129, 233)
// 默认字体黑
#define kBaseBlackColor         RGB(51, 51, 51)
// 默认背景色
#define kBaseBackgroundColor    RGB(238, 238, 238)

#endif /* DatePickHeader_h */
