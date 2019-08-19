//
//  AreaChoiceFootView.h
//  DatePickDemo
//
//  Created by sino on 2019/8/19.
//  Copyright © 2019年 sino. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol AreaChoiceFootViewDelegate <NSObject>

-(void)sendBtnTitle:(UIButton* )btn;

@end
@interface AreaChoiceFootView : UIView
@property(nonatomic,weak) id<AreaChoiceFootViewDelegate> delegate;
//@property (nonatomic,strong) UIButton *cancel;
@property (nonatomic,strong) UIButton *sure;

@end
