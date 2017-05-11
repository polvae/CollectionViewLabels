//
//  KGOPositionTwoTypeModel.m
//  jucaiwang
//
//  Created by KingSoft on 17/4/10.
//  Copyright © 2017年 kingo. All rights reserved.
//

#import "KGOPositionTwoTypeModel.h"

@implementation KGOPositionTwoTypeModel

-(void)setValue:(id)value forKey:(NSString *)key{
    [super setValue:value forKey:key];
    if ([key isEqualToString:@"zmc"]) {
        CGFloat width =[self boundingStr:value andFontSize:15];
        if (width < 100) {
            self.contentW = 100;
        }else if (width + 20 > [UIScreen mainScreen].bounds.size.width ){
            self.contentW = [UIScreen mainScreen].bounds.size.width  - 20;
        } else{
            self.contentW = [self boundingStr:value andFontSize:15] + 20;
        }
    }
//    NSArray *dataArr = [KGOStoreUserInfoTool getUserInfoWithkey:KSelectedInfo];
//    
//    for (NSDictionary *dic in dataArr) {
//        if ([dic[@"zmc"] isEqualToString:value]) {
//            self.isSelected = YES;
//        }
//    }
}

- (CGFloat)boundingStr:(NSString *)Str andFontSize:(CGFloat)fontSize{
    NSDictionary *attribute = @{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]};
    
    CGSize size = [Str boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attribute context:nil].size;
    
    return size.width;
}

@end
