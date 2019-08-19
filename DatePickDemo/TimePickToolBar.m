//
//  TimePickToolBar.m
//  DatePickDemo
//
//  Created by sino on 2019/8/19.
//  Copyright © 2019年 sino. All rights reserved.
//

#import "TimePickToolBar.h"
@interface TimePickToolBar ()
@property (nonatomic,strong) UIView *lineOne;
@property (nonatomic,strong) UIView *lineTwo;
@property (nonatomic,strong) UILabel *month;
@property (nonatomic,strong) UILabel *day;
@property (nonatomic,strong) UILabel *hour;
@property (nonatomic,strong) UILabel *min;

@end
@implementation TimePickToolBar

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        _leftBtn = [UIButton buttonWithType:(UIButtonTypeSystem)];
        [_leftBtn btnNormalImage:@"左右切换 蓝" highLightImage:@"左右切换 蓝"];
        [self addSubview:_leftBtn];
        [_leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(AutoSizeScaleX(17));
            make.top.offset(AutoSizeScaleY(15));
            make.width.mas_equalTo(AutoSizeScaleX(14));
            make.height.mas_equalTo(AutoSizeScaleY(20));
        }];
        
        _rightBtn = [UIButton buttonWithType:(UIButtonTypeSystem)];
        [_rightBtn btnNormalImage:@"右切换 蓝" highLightImage:@"右切换 蓝"];
        [self addSubview:_rightBtn];
        [_rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.offset(-AutoSizeScaleX(17));
            make.top.offset(AutoSizeScaleY(15));
            make.width.mas_equalTo(AutoSizeScaleX(14));
            make.height.mas_equalTo(AutoSizeScaleY(20));
        }];
        
        _yearLa = [[UILabel alloc] init];
        [_yearLa lableText:@"2017年" color:0x2386E7 font:16 textAlignment:1];
        [self addSubview:_yearLa];
        [_yearLa mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(_leftBtn.mas_centerY);
            make.centerX.equalTo(self.mas_centerX);
            make.width.mas_equalTo(AutoSizeScaleX(60));
            make.height.mas_equalTo(AutoSizeScaleY(24));
        }];
        
        _lineOne = [[UIView alloc] init];
        _lineOne.backgroundColor = RGBOF(0xCCCCCC);
        [self addSubview:_lineOne];
        [_lineOne mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.offset(-AutoSizeScaleX(17));
            make.top.offset(AutoSizeScaleY(40));
            make.left.offset(AutoSizeScaleX(17));
            make.height.mas_equalTo(AutoSizeScaleY(1));
        }];
        
        _lineTwo = [[UIView alloc] init];
        _lineTwo.backgroundColor = RGBOF(0xCCCCCC);
        [self addSubview:_lineTwo];
        [_lineTwo mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.offset(-AutoSizeScaleX(17));
            make.top.offset(AutoSizeScaleY(65));
            make.left.offset(AutoSizeScaleX(17));
            make.height.mas_equalTo(AutoSizeScaleY(1));
        }];
        
        _month = [[UILabel alloc] init];
        [_month lableText:@"月" color:0x666666 font:16 textAlignment:1];
        [self addSubview:_month];
        [_month mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(AutoSizeScaleX(50));
            make.top.equalTo(_lineOne.mas_bottom).offset(0);
            make.bottom.equalTo(_lineTwo.mas_top).offset(0);
            make.width.mas_equalTo(AutoSizeScaleX(16));
        }];
        
        _day = [[UILabel alloc] init];
        [_day lableText:@"日" color:0x666666 font:16 textAlignment:1];
        [self addSubview:_day];
        [_day mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_month.mas_right).offset(AutoSizeScaleX(70));
            make.top.equalTo(_lineOne.mas_bottom).offset(0);
            make.bottom.equalTo(_lineTwo.mas_top).offset(0);
            make.width.mas_equalTo(AutoSizeScaleX(16));
        }];
        
        _hour = [[UILabel alloc] init];
        [_hour lableText:@"时" color:0x666666 font:16 textAlignment:1];
        [self addSubview:_hour];
        [_hour mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_day.mas_right).offset(AutoSizeScaleX(70));
            make.top.equalTo(_lineOne.mas_bottom).offset(0);
            make.bottom.equalTo(_lineTwo.mas_top).offset(0);
            make.width.mas_equalTo(AutoSizeScaleX(16));
        }];
        
        _min = [[UILabel alloc] init];
        [_min lableText:@"分" color:0x666666 font:16 textAlignment:1];
        [self addSubview:_min];
        [_min mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.offset(-AutoSizeScaleX(50));
            make.top.equalTo(_lineOne.mas_bottom).offset(0);
            make.bottom.equalTo(_lineTwo.mas_top).offset(0);
            make.width.mas_equalTo(AutoSizeScaleX(16));
        }];
        
    }
    return self;
}

@end
