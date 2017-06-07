//
//  JYCBasicAnimation.m
//  JYCTransitionAnimation
//
//  Created by 贾远潮 on 2017/6/7.
//  Copyright © 2017年 jiayuanchao. All rights reserved.
//

#import "JYCBasicAnimation.h"

@interface JYCBasicAnimation ()

@property (nonatomic, assign) JYCShowType showType;

@end

@implementation JYCBasicAnimation

+ (__kindof JYCBasicAnimation *)basicAnimationWithShowType:(JYCShowType)showType
{
    return [[self alloc] initWithShowType:showType];
}

- (__kindof JYCBasicAnimation *)initWithShowType:(JYCShowType)showType
{
    if (self = [super init]) {
        self.showType = showType;
    }
    return self;
}

#pragma mark -- UIViewControllerAnimatedTransitioning

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    switch (self.showType) {
        case JYCShowTypePresent:
//            [self animationPresent:transitionContext];
            break;
        case JYCShowTypeDismiss:
//            [self animationDismiss:transitionContext];
            break;
        default:
            break;
    }
}



@end
