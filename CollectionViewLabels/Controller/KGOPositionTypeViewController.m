 //
//  KGOPositionTypeViewController.m
//  jucaiwang
//
//  Created by KingSoft on 17/4/7.
//  Copyright © 2017年 kingo. All rights reserved.
//

#import "KGOPositionTypeViewController.h"
#import "KGOPositionTypeCell.h"
#import "KGOPositionTypeHeaderView.h"
#import "KGOPositionOneTypeModel.h"
#import "KGOPositionTwoTypeModel.h"
#import "UICollectionViewLeftAlignedLayout.h"
#import "MJExtension.h"
#import "SDAutoLayout.h"
#import "KGOHearderView.h"

#define KKGOPositionTypeCell @"KGOPositionTypeCell.h"
#define KPositionTypeHeaderView @"KGOPositionTypeHeaderView"

#define KMaxSelectedNum (10)

//获取屏幕宽度的宏定义
#define KScreenWidth ([UIScreen mainScreen].bounds.size.width)
//获取屏幕高度的宏定义
#define KScreenHeight ([UIScreen mainScreen].bounds.size.height)
#define KColor(R,G,B) ([UIColor colorWithRed:(R)/255.0 green:(G)/255.0 blue:(B)/255.0 alpha:(1.0)])

@interface KGOPositionTypeViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, strong) NSMutableArray  *dataArr;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong)NSMutableArray *indexPathRowArr;
@property (nonatomic, strong)NSMutableArray *typeArr;
@property (nonatomic, strong)KGOHearderView *hearderView;

@end

@implementation KGOPositionTypeViewController

-(NSMutableArray *)typeArr{
    if (!_typeArr) {
        _typeArr = [NSMutableArray new];
    }
    return _typeArr;
}

-(NSMutableArray *)indexPathRowArr{
    if (!_indexPathRowArr) {
        _indexPathRowArr = [NSMutableArray new];
    }
    return _indexPathRowArr;
}

-(NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSMutableArray new];
    }
    return _dataArr;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    UICollectionViewLeftAlignedLayout *flowLayout=[[UICollectionViewLeftAlignedLayout alloc]init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical]; //设置竖直滚动
    flowLayout.minimumInteritemSpacing = 10;
    flowLayout.minimumLineSpacing = 10;
//    flowLayout.sectionInset = UIEdgeInsetsMake(10, 0, 10, 0);
    KGOHearderView *topView = [KGOHearderView new];
//    [self.view addSubview:topView];
    _hearderView = topView;
    
    self.collectionView=[[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    self.collectionView.dataSource=self;
    self.collectionView.delegate=self;
    [self.collectionView setBackgroundColor:KColor(241, 242, 246)];
    [self.collectionView registerClass:[KGOPositionTypeCell class] forCellWithReuseIdentifier:KKGOPositionTypeCell];
    [self.collectionView registerClass:[KGOPositionTypeHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:KPositionTypeHeaderView];
    [self.view sd_addSubviews:@[topView,self.collectionView]];
    
    self.hearderView.sd_layout
    .topSpaceToView(self.view,20)
    .rightSpaceToView(self.view,0)
    .leftSpaceToView(self.view,0);
    [self.hearderView setupAutoWidthFlowItems:@[] withPerRowItemsCount:0 verticalMargin:0 horizontalMargin:0 verticalEdgeInset:0 horizontalEdgeInset:0];
    self.hearderView.sd_layout.heightIs(0);

    self.collectionView.sd_layout
    .topSpaceToView(topView,0)
    .rightSpaceToView(self.view,0)
    .leftSpaceToView(self.view,0)
    .bottomSpaceToView(self.view,0);
    
    [self requestData];
}

#pragma mark  ---requestData---
- (void)requestData{
    ;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile: [[NSBundle mainBundle] pathForResource:@"data" ofType:@"json"]] options:NSJSONReadingMutableContainers error:nil];
    self.dataArr = [KGOPositionOneTypeModel mj_objectArrayWithKeyValuesArray:dic[@"resultSet"]];
    [self.collectionView reloadData];
}

//定义每个Item 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    KGOPositionOneTypeModel *oneModel = self.dataArr[indexPath.section];
    
    KGOPositionTwoTypeModel *model = oneModel.zid[indexPath.row];
    
    return  CGSizeMake(model.contentW, 35);  //设置cell宽高
}

//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0,10, 10, 10);
}


#pragma mark -- UICollectionViewDataSource
//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    KGOPositionOneTypeModel *oneModel = self.dataArr[section];
    return oneModel.zid.count;
}

//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.dataArr.count;
}

//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    KGOPositionTypeCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:KKGOPositionTypeCell forIndexPath:indexPath];
    KGOPositionOneTypeModel *oneModel = self.dataArr[indexPath.section];
    KGOPositionTwoTypeModel *model = oneModel.zid[indexPath.row];
    cell.typeContentStr = model.zmc;
    cell.ContentW = model.contentW;
    cell.isSelected = model.isSelected;
    
    __weak __typeof(self) weakSelf = self;
    __weak __typeof(cell) weakCell = cell;
    cell.clickActionType = ^(BOOL isSelected){
        if (weakSelf.indexPathRowArr.count > KMaxSelectedNum-1 && isSelected) {
            NSLog(@"大于%d个",KMaxSelectedNum);
            weakCell.isSelected = NO;
            return ;
        }
        KGOPositionOneTypeModel *changeSectionModel = self.dataArr[indexPath.section];
        KGOPositionTwoTypeModel *changeRowModel = changeSectionModel.zid[indexPath.row];
        changeRowModel.isSelected = isSelected;
        if (isSelected) {
            [weakSelf.typeArr addObject:model.zmc];
            [weakSelf.indexPathRowArr addObject:indexPath];
        }else{
            [weakSelf.typeArr removeObject:model.zmc];
            [weakSelf.indexPathRowArr removeObject:indexPath];
        }
        weakSelf.hearderView.labelArr = weakSelf.typeArr;
        [weakSelf.collectionView reloadItemsAtIndexPaths:weakSelf.indexPathRowArr];
    };
        [self.collectionView updateLayout];

    return cell;
}


- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    KGOPositionTypeHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:KPositionTypeHeaderView forIndexPath:indexPath];
    KGOPositionOneTypeModel *model = self.dataArr[indexPath.section];
    headerView.type = model.mc;
    return headerView;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(KScreenWidth, 44);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
