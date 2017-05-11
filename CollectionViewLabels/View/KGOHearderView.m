//
//  KGOHearderView.m
//  CollectionViewLabels
//
//  Created by KingSoft on 2017/5/10.
//  Copyright © 2017年 KingSoft. All rights reserved.
//

#import "KGOHearderView.h"
#import "SDAutoLayout.h"

@implementation KGOHearderView

-(instancetype)init{
   self = [super init];
    if (self) {

    }
    return self;
}

-(void)setLabelArr:(NSArray *)labelArr{
    _labelArr = labelArr;
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    NSMutableArray *temp = [NSMutableArray new];
    for (int i = 0; i < labelArr.count; i++) {
        UILabel *contentLabel = [UILabel new];
        contentLabel.backgroundColor = [UIColor lightGrayColor];
        contentLabel.text = labelArr[i];
        contentLabel.textColor = [UIColor whiteColor];
        contentLabel.textAlignment = NSTextAlignmentCenter;
        contentLabel.font = [UIFont systemFontOfSize:13.0];
        [self addSubview:contentLabel];
        contentLabel.lineBreakMode = NSLineBreakByTruncatingMiddle;
        contentLabel.sd_layout.heightIs(30); // 设置高度约束
        [temp addObject:contentLabel];
    }

    if (labelArr.count > 0) {
        [self setupAutoWidthFlowItems:[temp copy] withPerRowItemsCount:3 verticalMargin:5 horizontalMargin:5 verticalEdgeInset:5 horizontalEdgeInset:10];
    }else{
        [self setupAutoWidthFlowItems:[temp copy] withPerRowItemsCount:0 verticalMargin:0 horizontalMargin:0 verticalEdgeInset:0 horizontalEdgeInset:0];
        self.sd_layout.heightIs (0);
    }

    [self updateLayout];

}

@end
