//
//  UILabel+Text.m
//  DatePickDemo
//
//  Created by sino on 2019/8/19.
//  Copyright © 2019年 sino. All rights reserved.
//

#import "UILabel+Text.h"

@implementation UILabel (Text)

- (void)lableText:(NSString *)string color:(unsigned int)hex font:(float)font textAlignment:(NSInteger)textAlignment {
    
    self.text = string;
    self.textColor = RGBOF(hex);
    self.font = Font(font);
    self.textAlignment = textAlignment;
    
}

- (void)lableText:(NSString *)string color:(unsigned int)hex alphe:(CGFloat)alphe font:(float)font textAlignment:(NSInteger)textAlignment {
    self.text = string;
    self.textColor = RGBAOF(hex, alphe);
    self.font = Font(font);
    self.textAlignment = textAlignment;
}
@end
