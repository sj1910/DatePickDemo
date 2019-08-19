//
//  UILabel+Text.h
//  DatePickDemo
//
//  Created by sino on 2019/8/19.
//  Copyright © 2019年 sino. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Text)

- (void)lableText:(NSString *)string color:(unsigned int)hex font:(float)font textAlignment:(NSInteger)textAlignment;

- (void)lableText:(NSString *)string color:(unsigned int)hex alphe:(CGFloat)alphe font:(float)font textAlignment:(NSInteger)textAlignment;
@end
