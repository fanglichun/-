//
//  WaterCell.m
//  瀑布流
//
//  Created by flc on 15/7/24.
//  Copyright (c) 2015年 flc. All rights reserved.
//

#import "WaterCell.h"

@implementation WaterCell

// 重写initWithFrame方法.
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        NSLog(@"initWithFrame:%@", NSStringFromCGRect(frame));
        _label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 100)];
        _label.textAlignment = NSTextAlignmentCenter;
        _label.font = [UIFont systemFontOfSize:40.0f];
        _label.textColor = [UIColor orangeColor];
        [self addSubview:_label];
    }
    
    return self;
}

// 改变cell的frame会调用
- (void)layoutSubviews
{
    [super layoutSubviews];
    NSLog(@"layoutSubviews:%@", NSStringFromCGRect(self.frame));
    // 根据cell的宽高重新设置label的宽高
    _label.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
}


// 返回复用ID
+ (NSString *)identifier
{
    return @"myCell";
}

@end
