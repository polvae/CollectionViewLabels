//
//  KGOPositionTypeCell.h
//  jucaiwang
//
//  Created by KingSoft on 17/4/7.
//  Copyright © 2017年 kingo. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^BlockType)(BOOL);


@interface KGOPositionTypeCell : UICollectionViewCell

@property (nonatomic, copy)NSString *typeContentStr;
@property (nonatomic, assign)CGFloat ContentW;
@property (nonatomic, assign)BOOL isSelected;
@property (nonatomic, copy)BlockType clickActionType;

@end
