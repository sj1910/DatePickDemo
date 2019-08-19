//
//  DataPickerViewController.m
//  DatePickDemo
//
//  Created by sino on 2019/8/19.
//  Copyright © 2019年 sino. All rights reserved.
//
#import "DataPickerViewController.h"
#import "AreaChoiceFootView.h"
#import "TimePickToolBar.h"

@interface DataPickerViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>{
    
    NSMutableArray *yearArray;
    NSArray *monthArray;
    NSMutableArray *DaysArray;
    NSString *currentMonthString;
    NSMutableArray *hourArr;
    NSMutableArray *minArr;
    NSInteger selectedMonthRow;
    int year;
    int month;
    int day;
    int  hour;
    int min;
    
}

@property (nonatomic,strong) AreaChoiceFootView *searchBtnView;
@property (nonatomic,strong) UIPickerView *customPicker;
@property (nonatomic,strong) TimePickToolBar *toolbarCancelDone;

@end

@implementation DataPickerViewController

//- (void)viewWillAppear:(BOOL)animated {
//
//    [super viewWillAppear:animated];
//
//}
- (void)getCurrentDate {
    
    yearArray = [[NSMutableArray alloc]init];
    
    for (int i = 1990; i <= 2050 ; i++) {
        
        [yearArray addObject:[NSString stringWithFormat:@"%d",i]];
    }
    
    // PickerView -  Months data
    monthArray = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12"];
    DaysArray = [[NSMutableArray alloc]init];
    for (int i = 1; i <= 31; i++) {
        
        [DaysArray addObject:[NSString stringWithFormat:@"%d",i]];
    }
    
    hourArr = [NSMutableArray array];
    for (int i = 1; i < 25; i++) {
        
        if (i == 24) {
            
            [hourArr addObject:[NSString stringWithFormat:@"00"]];
        }else{
            
            [hourArr addObject:[NSString stringWithFormat:@"%d",i]];
        }
    }
    
    minArr = [NSMutableArray array];
    for (int i = 1; i < 61; i++) {
        
        if (i == 60) {
            
            [minArr addObject:[NSString stringWithFormat:@"00"]];
        }else{
            
            [minArr addObject:[NSString stringWithFormat:@"%d",i]];
        }
    }
    
    NSDate *date = [NSDate date];;
    
    // Get Current Year
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithAbbreviation:@"GMT+0800"];
    [formatter setTimeZone:timeZone];
    [formatter setDateFormat:@"yyyy"];
    NSString *currentyearString = [NSString stringWithFormat:@"%@", [formatter stringFromDate:date]];
    year = [currentyearString intValue];
    
    // Get Current  Month
    [formatter setDateFormat:@"MM"];
    currentMonthString = [NSString stringWithFormat:@"%ld",(long)[[formatter stringFromDate:date] integerValue]];
    month = [currentMonthString intValue];
    selectedMonthRow = month - 1;
    
    // Get Current  Date
    [formatter setDateFormat:@"dd"];
    NSString *currentDateString = [NSString stringWithFormat:@"%@",[formatter stringFromDate:date]];
    day =[currentDateString intValue];
    
    [formatter setDateFormat:@"HH"];
    NSString *currentHourString = [NSString stringWithFormat:@"%@",[formatter stringFromDate:date]];
    hour =[currentHourString intValue];
    
    [formatter setDateFormat:@"mm"];
    NSString *currentMinString = [NSString stringWithFormat:@"%@",[formatter stringFromDate:date]];
    min = [currentMinString intValue];
    
    [self.customPicker selectRow:month - 1 inComponent:0 animated:NO];
    [self.customPicker selectRow:day - 1 inComponent:1 animated:NO];
    [self.customPicker selectRow:hour == 0 ? 23 : hour - 1 inComponent:2 animated:NO];
    [self.customPicker selectRow:min == 0 ? 59 : min - 1 inComponent:3 animated:NO];
    [self.customPicker reloadAllComponents];
    self.toolbarCancelDone.yearLa.text = [NSString stringWithFormat:@"%d年",year];
    
}


#pragma mark --- 懒加载头尾图 ---
- (AreaChoiceFootView *)searchBtnView {
    
    if (!_searchBtnView) {
        
        _searchBtnView = [[AreaChoiceFootView alloc] initWithFrame:CGRectMake(0,AutoSizeScaleY(277) + AutoSizeScaleY(40),MainWidth,AutoSizeScaleY(50))];
        [_searchBtnView.sure addTarget:self action:@selector(sendBtnTitle:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _searchBtnView;
}


#pragma mark --- 添加关注路线取消头视图 ---
- (ChoiceLineQuiteView *)quiteView {
    
    if (!_quiteView) {
        
        _quiteView = [[ChoiceLineQuiteView alloc] initWithFrame:CGRectMake(0, AutoSizeScaleY(0), MainWidth, AutoSizeScaleY(40))];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(quit)];
        [_quiteView.quiteImg addGestureRecognizer:tap];
    }
    return _quiteView;
}


- (void)quit {
    
    [UIView animateWithDuration:0.35f animations:^{
        
        self.view.frame = CGRectMake(0,MainHeight, MainWidth, AutoSizeScaleY(367));
    } completion:^(BOOL finished) {
        [self.view removeFromSuperview];
    }];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = RGBOF(0xEEEEEE);
    [self.view addSubview:self.quiteView];
    [self.view addSubview:self.searchBtnView];
    [self createPickView];
}


- (void)createPickView {
    
    self.customPicker = [[UIPickerView alloc] initWithFrame:CGRectMake(0, AutoSizeScaleY(110), MainWidth, AutoSizeScaleY(212))];
    self.customPicker.backgroundColor = RGBOF(0xEEEEEE);
    self.customPicker.delegate = self;
    self.customPicker.dataSource = self;
    [self.view addSubview:_customPicker];
    
    self.toolbarCancelDone = [[TimePickToolBar alloc] initWithFrame:CGRectMake(0, AutoSizeScaleY(40), MainWidth, AutoSizeScaleY(70))];
    [self.toolbarCancelDone.leftBtn addTarget:self action:@selector(yearReduce) forControlEvents:(UIControlEventTouchUpInside)];
    [self.toolbarCancelDone.rightBtn addTarget:self action:@selector(yearAdd) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:_toolbarCancelDone];
    
    // PickerView - Default Selection as per current Date
    // 设置初始默认值
    
    [self getCurrentDate];
    
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    if (component == 0) {
        
        selectedMonthRow = row;
        [self.customPicker reloadAllComponents];
    }
    else if (component == 1) {
        
        [self.customPicker reloadAllComponents];
    }
    else if (component == 2) {
        
        [self.customPicker reloadAllComponents];
    }else{
        
        [self.customPicker reloadAllComponents];
    }
}

#pragma mark - UIPickerViewDatasource
- (UIView *)pickerView:(UIPickerView *)pickerView
            viewForRow:(NSInteger)row
          forComponent:(NSInteger)component
           reusingView:(UIView *)view {
    
    // Custom View created for each component
    UILabel *pickerLabel = (UILabel *)view;
    
    if (!pickerLabel) {
        
        pickerLabel = [[UILabel alloc] init];
        //        pickerLabel.adjustsFontSizeToFitWidth = YES;
        pickerLabel.textAlignment = NSTextAlignmentCenter;
        [pickerLabel setBackgroundColor:[UIColor clearColor]];
        [pickerLabel setFont:Font(15)];
        pickerLabel.textColor = kBaseBlueColor;
    }
    if (component == 0) {
        
        pickerLabel.text =  [monthArray objectAtIndex:row]; // 月
    }
    else if (component == 1) {
        
        pickerLabel.text =  [DaysArray objectAtIndex:row];  // 天
    }
    else if (component == 2) {
        
        pickerLabel.text =  [hourArr objectAtIndex:row]; // 小时
    }else{
        
        pickerLabel.text =  [minArr objectAtIndex:row]; // 分钟
    }
    return pickerLabel;
}

//- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
//{
//    // 由于该控件只包含一列，因此无须理会列序号参数component
//    // 该方法根据row参数返回teams中的元素，row参数代表列表项的编号，
//    // 因此该方法表示第几个列表项，就使用teams中的第几个元素
//
//    if (component == 0) {
//
//        return [monthArray objectAtIndex:row]; // 月
//    }
//    else if (component == 1) {
//
//        return [DaysArray objectAtIndex:row];  // 天
//    }
//    else if (component == 2) {
//
//        return [hourArr objectAtIndex:row]; // 小时
//    }else{
//
//        return [minArr objectAtIndex:row]; // 分钟
//    }
//
//}
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return 30;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    
    return 4;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    if (component == 0) {
        
        return 12;
        
    }else if (component == 1){
        
        if (selectedMonthRow == 0 || selectedMonthRow == 2 || selectedMonthRow == 4 || selectedMonthRow == 6 || selectedMonthRow == 7 || selectedMonthRow == 9 || selectedMonthRow == 11) {
            
            return 31;
        }
        else if (selectedMonthRow == 1) {
            
            
            if(((year %4==0)&&(year %100!=0))||(year %400==0)){
                
                return 29;
            }
            else {
                
                return 28; // or return 29
            }
        }
        else {
            
            return 30;
        }
    }else if (component == 2){
        
        return 24;
    }else{
        
        return 60;
    }
}


#pragma mark --- 年份加减方法 ---
- (void)yearReduce {
    
    if (year > 1990) {
        
        year--;
        self.toolbarCancelDone.yearLa.text = [NSString stringWithFormat:@"%d年",year];
        [self.customPicker reloadAllComponents];
    }
}


- (void)yearAdd {
    
    if (year < 2050) {
        
        year++;
        self.toolbarCancelDone.yearLa.text = [NSString stringWithFormat:@"%d年",year];
        [self.customPicker reloadAllComponents];
    }
}


#pragma mark --- 按钮协议方法 ---
-(void)sendBtnTitle:(UIButton *)btn{
    
    NSString *secMonth = [monthArray objectAtIndex:[self.customPicker selectedRowInComponent:0]];
    if (secMonth.length == 1) {
        
        secMonth = [NSString stringWithFormat:@"0%@",secMonth];
    }
    
    NSString *secDay = [DaysArray objectAtIndex:[self.customPicker selectedRowInComponent:1]];
    if (secDay.length == 1) {
        
        secDay = [NSString stringWithFormat:@"0%@",secDay];
    }
    
    NSString *secHour = [hourArr objectAtIndex:[self.customPicker selectedRowInComponent:2]];
    if (secHour.length == 1) {
        
        secHour = [NSString stringWithFormat:@"0%@",secHour];
    }
    
    NSString *secMin = [minArr objectAtIndex:[self.customPicker selectedRowInComponent:3]];
    if (secMin.length == 1) {
        
        secMin = [NSString stringWithFormat:@"0%@",secMin];
    }
    
    self.choice([NSString stringWithFormat:@"%d年%@月%@日 %@:%@:00",year,secMonth,secDay,secHour,secMin],btn);
    [self quit];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)dealloc {
    NSLog(@"%@ dealloc",NSStringFromClass([self class]));
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
