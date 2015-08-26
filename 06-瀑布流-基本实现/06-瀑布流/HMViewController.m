//
//  HMViewController.m
//  06-瀑布流
//
//  Created by apple on 14-7-28.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "HMViewController.h"
#import "HMWaterflowView.h"
#import "HMWaterflowViewCell.h"

@interface HMViewController () <HMWaterflowViewDataSource, HMWaterflowViewDelegate>

@end

@implementation HMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    HMWaterflowView *waterflowView = [[HMWaterflowView alloc] init];
    waterflowView.frame = self.view.bounds;
    waterflowView.dataSource = self;
    waterflowView.delegate = self;
    [self.view addSubview:waterflowView];
    
    
    
    // 刷新数据
    [waterflowView reloadData];
    
    
    
}

#pragma mark - 数据源方法
- (NSUInteger)numberOfCellsInWaterflowView:(HMWaterflowView *)waterflowView
{
    return 50;
    
}



//- (NSUInteger)numberOfColumnsInWaterflowView:(HMWaterflowView *)waterflowView
//{
//    return 4;
//}

- (HMWaterflowViewCell *)waterflowView:(HMWaterflowView *)waterflowView cellAtIndex:(NSUInteger)index
{
    static NSString *ID = @"cell";
    HMWaterflowViewCell *cell = [waterflowView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[HMWaterflowViewCell alloc] init];
        cell.identifier = ID;
        cell.backgroundColor = HMRandomColor;
        [cell addSubview:[UIButton buttonWithType:UIButtonTypeDetailDisclosure]];
    
        UILabel *label = [[UILabel alloc] init];
        label.tag = 10;
        label.frame = CGRectMake(0, 0, 50, 20);
        label.text = [NSString stringWithFormat:@"%ld", index + 1];
        [cell addSubview:label];
    }
    
    UILabel *label = (UILabel *)[cell viewWithTag:10];
    //label.text = [NSString stringWithFormat:@"%ld", index];
    NSLog(@"%ld %p", index, cell);
    
    return cell;
}

#pragma mark - 代理方法
- (CGFloat)waterflowView:(HMWaterflowView *)waterflowView heightAtIndex:(NSUInteger)index
{
    switch (index % 3) {
        case 0: return 70;
        case 1: return 100;
        case 2: return 90;
        default: return 110;
    }
    
}

- (CGFloat)waterflowView:(HMWaterflowView *)waterflowView marginForType:(HMWaterflowViewMarginType)type
{
    
    switch (type) {

        case HMWaterflowViewMarginTypeTop: return 30;
        case HMWaterflowViewMarginTypeBottom: return 50;
        case HMWaterflowViewMarginTypeLeft: return 10;
        case HMWaterflowViewMarginTypeRight: return 20;
        case HMWaterflowViewMarginTypeColumn: return 20;
            default:
        return 5;
            
    }
}

- (void)waterflowView:(HMWaterflowView *)waterflowView didSelectAtIndex:(NSUInteger)index
{
    //NSLog(@"点击了第%ld个cell", index);
    
    
}
@end
