//
//  ChoiceLineQuiteView.m
//  DatePickDemo
//
//  Created by sino on 2019/8/19.
//  Copyright © 2019年 sino. All rights reserved.
//

#import "ChoiceLineQuiteView.h"

@implementation ChoiceLineQuiteView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor orangeColor];
        _quiteImg = [[UIImageView alloc] init];
//        _quiteImg.image = image(@"关闭");
        _quiteImg.userInteractionEnabled = YES;
        [self addSubview:_quiteImg];
        _areaLa = [[UILabel alloc] init];
        [_areaLa lableText:@"时间选择" color:0x666666 font:16 textAlignment:0];
        [self addSubview:_areaLa];
        
    }
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    [_quiteImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-AutoSizeScaleX(16));
        make.centerY.equalTo(self.mas_centerY);
        make.width.mas_equalTo(AutoSizeScaleX(30));
        make.height.mas_equalTo(AutoSizeScaleY(30));
    }];
    [_areaLa mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AutoSizeScaleX(16));
        make.centerY.equalTo(self.mas_centerY);
        make.height.mas_equalTo(AutoSizeScaleY(15));
        make.width.mas_equalTo(AutoSizeScaleX(150));
    }];
}
@end
