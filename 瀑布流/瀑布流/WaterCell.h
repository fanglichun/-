//
//  WaterCell.h
//  瀑布流
//
//  Created by flc on 15/7/24.
//  Copyright (c) 2015年 flc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WaterCell : UICollectionViewCell

@property (nonatomic, strong) UILabel *label;

+ (NSString *)identifier;
@end
