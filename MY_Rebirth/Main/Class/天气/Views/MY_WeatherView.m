//
//  MY_WeatherView.m
//  MY_Rebirth
//
//  Created by ifly on 2017/2/28.
//  Copyright © 2017年 Meiyang. All rights reserved.
//

#import "MY_WeatherView.h"
#import "MY_HumidityView.h"
#import "MY_WindSpeedView.h"
#import "MY_TemperatureView.h"
#import "MY_SunInfoView.h"
#import "MY_MaxTempView.h"
#import "MY_WeatherInfoView.h"
#import "MY_WeekWeatherViewController.h"

@interface MY_WeatherView ()<UITableViewDelegate,UIViewControllerTransitioningDelegate>

/**
 tableView
 */
@property (nonatomic, strong) UITableView *myWeatherTableView;
/**
 湿度
 */
@property (nonatomic, strong) MY_HumidityView *humidityView;
/**
 风速
 */
@property (nonatomic, strong) MY_WindSpeedView *windSpeedView;
/**
 气温
 */
@property (nonatomic, strong) MY_TemperatureView *temperatureView;
/**
 日出
 */
@property (nonatomic, strong) MY_SunInfoView *sunInfoView;
/**
 温差
 */
@property (nonatomic, strong) MY_MaxTempView *maxTempView;
/**
 阳光
 */
@property (nonatomic, strong) MY_WeatherInfoView *weatherInfoView;


@end


@implementation MY_WeatherView

/**
 创建视图
 */
- (void)my_weatherViewBuildView {
    
    [self addSubview:self.myWeatherTableView];
    
    if (iPhone4_4s) {
        //显示控件
        //湿度
        self.humidityView = [[MY_HumidityView alloc] initWithFrame:CGRectMake(0, Height - Width / 2.f, Width / 2.f, Width / 2.f)];
        [self.myWeatherTableView addSubview:self.humidityView];
        //阳光
        
        //气温
        
        //天气
        
    } else {
        //显示控件
        //温度
        self.temperatureView = [[MY_TemperatureView alloc] initWithFrame:CGRectMake(Width / 2, Height - 3 * Width / 2 - 64, Width / 2.f, Width / 2.f) temperature:16];
        [self.myWeatherTableView addSubview:self.temperatureView];
        //湿度
        self.humidityView = [[MY_HumidityView alloc] initWithFrame:CGRectMake(0, Height - Width - 64, Width / 2.f, Width / 2.f) withHumidity:10];
        [self.myWeatherTableView addSubview:self.humidityView];
        //风速
        self.windSpeedView = [[MY_WindSpeedView alloc] initWithFrame:CGRectMake(Width / 2.f, Height - Width / 2.f - 64, Width / 2.f, Width / 2.f) windSpeed:1.f];
        [self.myWeatherTableView addSubview:self.windSpeedView];
        //气温差
        self.maxTempView = [[MY_MaxTempView alloc] initWithFrame:CGRectMake(9, Height - Width / 2.f - 64, Width / 2.f, Width / 2.f) HeightTem:@"16" lowTem:@"8"];
        [self.myWeatherTableView addSubview:self.maxTempView];
        //阳光
        self.weatherInfoView = [[MY_WeatherInfoView alloc] initWithFrame:CGRectMake(0, Height - 3 * Width / 2 - 64, Width / 2, Width / 2) weatherNumber:800];
        [self.myWeatherTableView addSubview:self.weatherInfoView];
        //日出/落
        self.sunInfoView = [[MY_SunInfoView alloc] initWithFrame:CGRectMake(Width / 2.f, Height - Width - 64, Width / 2.f, Width / 2.f) withSunSire:@"06:16" sunSet:@"18:01"];
        [self.myWeatherTableView addSubview:self.sunInfoView];
    }
    //创建出线条
    UIView *firstLV = [[UIView alloc] initWithFrame:CGRectMake(0, Height - 3 * Width / 2 - 64, MAINSCREEN_WIDTH, 1)];
    [self.myWeatherTableView addSubview:firstLV];
    firstLV.backgroundColor = [UIColor lightGrayColor];
    //线二
    UIView *secondLV = [[UIView alloc] initWithFrame:CGRectMake(0, Height - Width - 64,  MAINSCREEN_WIDTH, 1)];
    [self.myWeatherTableView addSubview:secondLV];
    secondLV.backgroundColor = [UIColor lightGrayColor];
    //线三
    UIView *threeLV = [[UIView alloc] initWithFrame:CGRectMake(0, Height - Width / 2.f - 64, MAINSCREEN_WIDTH, 1)];
    [self.myWeatherTableView addSubview:threeLV];
    threeLV.backgroundColor = [UIColor lightGrayColor];
    //线四
    UIView *fourLV = [[UIView alloc] initWithFrame:CGRectMake(Width / 2, Height - 3 * Width / 2 - 64, 1, MAINSCREEN_WIDTH / 2 * 3)];
    [self.myWeatherTableView addSubview:fourLV];
    fourLV.backgroundColor = [UIColor lightGrayColor];
    
}


/**
 显示动画
 */
- (void)my_weatherViewAnimationShow {
    
    //湿度
    self.humidityView.humidityPercent = 14/100.f;
    //风速显示
    
    self.windSpeedView.circleByOneSecond = 3 / 10.f;
    
    
    
}


- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    //位移超过60后执行动画效果
    if (scrollView.contentOffset.y >= 60) {
        MY_WeekWeatherViewController *weatherVC = [[MY_WeekWeatherViewController alloc] init];
        
        [[MY_GlobalManager currentViewController] presentViewController:weatherVC animated:YES
                                                             completion:nil];
    }
}

//制定转场动画
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return nil;
}


- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    
    return nil;
}






















#pragma mark ------------//懒加载\\------------
- (UITableView *)myWeatherTableView {
    if (_myWeatherTableView == nil) {
        _myWeatherTableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
        _myWeatherTableView.delegate = self;
        _myWeatherTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _myWeatherTableView.backgroundColor = [UIColor clearColor];
    }
    return _myWeatherTableView;
}

@end
