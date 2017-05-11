//
//  KGOPositionTypeHeaderView.m
//  jucaiwang
//
//  Created by KingSoft on 17/4/7.
//  Copyright © 2017年 kingo. All rights reserved.
//

#import "KGOPositionTypeHeaderView.h"

@interface KGOPositionTypeHeaderView ()
@property (nonatomic, strong)UILabel *kindLB;

@end

@implementation KGOPositionTypeHeaderView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self creatHeader];
    }
    return self;
}

- (void)creatHeader{
    UILabel *kindLB = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, self.bounds.size.width - 20, self.bounds.size.height)];
    [self addSubview:kindLB];
    kindLB.font = [UIFont systemFontOfSize:17];
    kindLB.textColor = [UIColor blackColor];
    self.kindLB = kindLB;
}

-(void)setType:(NSString *)type{
    _type = type;
    _kindLB.text = type;
}

@end
