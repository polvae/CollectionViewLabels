//
//  KGOPositionTypeViewController.h
//  jucaiwang
//
//  Created by KingSoft on 17/4/7.
//  Copyright © 2017年 kingo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^myNewBlockType)(void

);

@interface KGOPositionTypeViewController : UIViewController

@property (nonatomic, copy)myNewBlockType clickAction;
@property (nonatomic, strong)NSArray *addressArr;
@property (nonatomic, copy)NSString *addressKey;
@property (nonatomic, copy)NSString *addressName;

@end
