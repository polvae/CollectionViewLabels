//
//  KGOPositionTwoTypeModel.h
//  jucaiwang
//
//  Created by KingSoft on 17/4/10.
//  Copyright © 2017年 kingo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface KGOPositionTwoTypeModel : NSObject
@property (nonatomic, copy)NSString *zdm;// = A0400;
@property (nonatomic, copy)NSString *zmc;//
@property (nonatomic, assign)CGFloat contentW;//文字宽度
@property (nonatomic, assign)BOOL isSelected;

@end
