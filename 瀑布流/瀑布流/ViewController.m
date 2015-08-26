//
//  ViewController.m
//  瀑布流
//
//  Created by flc on 15/7/24.
//  Copyright (c) 2015年 flc. All rights reserved.
//

#import "ViewController.h"

#import "CHTCollectionViewWaterfallLayout.h"

#import "MyView.h"

#import "WaterCell.h"

@interface ViewController () <CHTCollectionViewDelegateWaterfallLayout, UICollectionViewDataSource>
{
    UICollectionView    *_collectionView;
    NSMutableArray      *_sizeArr; // 装载每个cell的大小(CGSize)
    
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 初始化cell大小的数组
    [self initArr];
    
    // 初始化瀑布流布局
    CHTCollectionViewWaterfallLayout *layout = [[CHTCollectionViewWaterfallLayout alloc] init];
    // 列之间的间距
    layout.minimumColumnSpacing = 10;
    
    // 每列之间cell的间距
    layout.minimumInteritemSpacing = 20;
    
    // 每组的内边距
    layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    
    // 尾部视图的高度
    layout.footerHeight = 40;
    
    // 头部视图的高度
    layout.headerHeight = 30;
    
    // 列数
    layout.columnCount = 3;
    
    _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    _collectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_collectionView];
    
    // 注册可复用的cell类
    [_collectionView registerClass:[WaterCell class] forCellWithReuseIdentifier:[WaterCell identifier]];
    
    
    // 注册可复用的头部视图
    [_collectionView registerClass:[MyView class] forSupplementaryViewOfKind:CHTCollectionElementKindSectionHeader withReuseIdentifier:[MyView identifier]];
    
    // 注册可复用的尾部视图
    [_collectionView registerClass:[MyView class] forSupplementaryViewOfKind:CHTCollectionElementKindSectionFooter withReuseIdentifier:[MyView identifier]];
}

- (void)initArr {
    _sizeArr = [NSMutableArray arrayWithCapacity:0];
    for (int i = 0; i < 30; i ++) {
        //           1        50
        // 实际宽度 : 100     50 * (100 / 1)
        CGSize size = CGSizeMake(100, arc4random() % 50 + 50 );
        [_sizeArr addObject:[NSValue valueWithCGSize:size]];
    }
}

#pragma mark - CollectionView Delegate&DataSource
#pragma mark 组
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return  2;
}

#pragma mark 每组多少项
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _sizeArr.count;
}

#pragma mark 填充cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    WaterCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[WaterCell identifier] forIndexPath:indexPath];
     NSLog(@"%@", NSStringFromCGRect(cell.frame));
    cell.backgroundColor = [UIColor lightGrayColor];
    cell.label.text = [NSString stringWithFormat:@"%li", indexPath.row];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    MyView *myView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:[MyView identifier] forIndexPath:indexPath];
   
    if (kind == CHTCollectionElementKindSectionHeader) { // 头部视图
        myView.backgroundColor = [UIColor blueColor];
    } else { // 尾部视图
        myView.backgroundColor = [UIColor greenColor];
    }
    return myView ;
}

#pragma mark 返回cell的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //NSLog(@"hahahha");
    return [_sizeArr[indexPath.row] CGSizeValue];
}



@end
