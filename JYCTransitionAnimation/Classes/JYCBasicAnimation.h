//
//  JYCBasicAnimation.h
//  JYCTransitionAnimation
//
//  Created by 贾远潮 on 2017/6/7.
//  Copyright © 2017年 jiayuanchao. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, JYCShowType) {
    JYCShowTypeNone,
    JYCShowTypePresent,
    JYCShowTypeDismiss,
};

@interface JYCBasicAnimation : NSObject<UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign, readonly) JYCShowType showType;

+ (__kindof JYCBasicAnimation *)basicAnimationWithShowType:(JYCShowType)showType;

- (__kindof JYCBasicAnimation *)initWithShowType:(JYCShowType)showType;

@end
