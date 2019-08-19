//
//  UIButton+Text.h
//  DatePickDemo
//
//  Created by sino on 2019/8/19.
//  Copyright © 2019年 sino. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Text)

- (void)btnText:(NSString *)string color:(unsigned int)hex font:(float)font;

- (void)btnNormalImage:(NSString *)normalImage highLightImage:(NSString *)highLightImage;

- (void)btnText:(NSString *)string backgroundColor:(unsigned int)backgroundHex color:(unsigned int)hex font:(float)font;
@end
