//
//  KGOPositionTypeCell.m
//  jucaiwang
//
//  Created by KingSoft on 17/4/7.
//  Copyright © 2017年 kingo. All rights reserved.
//

#import "KGOPositionTypeCell.h"



@interface KGOPositionTypeCell ()

@property (nonatomic, strong)UIButton *typeBtn;

@end

@implementation KGOPositionTypeCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self buildSubView];
    }
    return self;
}

- (void)buildSubView{
    UIButton *typeBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, self.bounds.size.height)];
    [typeBtn setTitleColor: [UIColor whiteColor] forState:UIControlStateNormal];
    [typeBtn setTitleColor: [UIColor blackColor] forState:UIControlStateSelected];
    typeBtn.backgroundColor = [UIColor brownColor];
    typeBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [self.contentView  addSubview:typeBtn];
    self.typeBtn = typeBtn;
    typeBtn.layer.borderWidth = 1;
    typeBtn.layer.borderColor =  [UIColor grayColor].CGColor;
    [self.typeBtn addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)setTypeContentStr:(NSString *)typeContentStr{
    _typeContentStr = typeContentStr;
    [self.typeBtn setTitle:typeContentStr forState:UIControlStateNormal];
}

-(void)setContentW:(CGFloat)ContentW{
    _ContentW = ContentW;
    CGRect frame = self.typeBtn.frame;
    frame.size.width = ContentW;
    self.typeBtn.frame = frame;
}

-(void)setIsSelected:(BOOL)isSelected{
    
    _isSelected = isSelected;
    self.typeBtn.selected = isSelected;
    if (isSelected) {
        self.typeBtn.layer.borderColor =[UIColor lightGrayColor].CGColor;
        
    }else{
        self.typeBtn.layer.borderColor = [UIColor grayColor].CGColor;
        
    }
}

- (void)clickAction:(UIButton *)btn{
    btn.selected = !btn.selected;
    if (self.clickActionType) {
        self.clickActionType(btn.selected);
    }
    if (btn.selected) {
        self.typeBtn.layer.borderColor =[UIColor lightGrayColor].CGColor;
        
    }else{
        self.typeBtn.layer.borderColor = [UIColor grayColor].CGColor;
        
    }
}


@end
