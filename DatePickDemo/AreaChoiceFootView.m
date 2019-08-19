//
//  AreaChoiceFootView.m
//  DatePickDemo
//
//  Created by sino on 2019/8/19.
//  Copyright © 2019年 sino. All rights reserved.
//

#import "AreaChoiceFootView.h"
@interface AreaChoiceFootView ()

@end
@implementation AreaChoiceFootView

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */
- (instancetype)initWithFrame:(CGRect)frame {
    self  = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = RGBOF(0xFFFFFF);
        //        _cancel = [UIButton buttonWithType:(UIButtonTypeSystem)];
        //        [_cancel btnText:@"取消" color:0xFFFFFF font:17];
        //        [_cancel addTarget:self action:@selector(pressBtnWithTitle:) forControlEvents:UIControlEventTouchUpInside];
        //
        //        [self addSubview:_cancel];
        _sure = [UIButton buttonWithType:(UIButtonTypeSystem)];
        [_sure btnText:@"确定" color:0xFFFFFF font:17];
        [_sure setBackgroundColor:kBaseBlueColor];
        [_sure addTarget:self action:@selector(pressBtnWithTitle:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:_sure];
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    //    [_cancel mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.left.offset(AutoSizeScaleX(0));
    //        make.top.offset(AutoSizeScaleY(0));
    //        make.height.mas_equalTo(self.mas_height);
    //        make.width.mas_equalTo(MainWidth/2);
    //    }];
    [_sure mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AutoSizeScaleX(0));
        make.top.offset(AutoSizeScaleY(0));
        make.height.mas_equalTo(self.mas_height);
        make.width.mas_equalTo(self);
    }];
}

-(void)pressBtnWithTitle:(UIButton* )btn{
    
    if ([self.delegate respondsToSelector:@selector(sendBtnTitle:)]) {
        [self.delegate sendBtnTitle:btn];
    }else{
        //        NSLog(@"被动方没有实现协议方法");
    }
}
@end
