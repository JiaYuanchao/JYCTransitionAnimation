//
//  JYCTransitionAnimationManager.m
//  JYCTransitionAnimation
//
//  Created by 贾远潮 on 2017/6/6.
//  Copyright © 2017年 jiayuanchao. All rights reserved.
//

#import "JYCTransitionAnimationManager.h"
#import "JYCModalAnimation.h"
#import "JYCSpressAnimation.h"

@interface JYCTransitionAnimationManager ()

@property (nonatomic, assign) JYCTransitionAnimation animationType;

@property (nonatomic, strong) JYCBasicAnimation *presentAnimation;

@property (nonatomic, strong) JYCBasicAnimation *dismissAnimation;

@end

@implementation JYCTransitionAnimationManager

+ (__kindof JYCTransitionAnimationManager *)transitionAnimationManagerWithAninationType:(JYCTransitionAnimation)animationType
{
    return [[self alloc] initWithAninationType:animationType];
}

- (__kindof JYCTransitionAnimationManager *)initWithAninationType:(JYCTransitionAnimation)animationType
{
    if (animationType == JYCTransitionAnimationNone) {
        return nil;
    }
    if (self = [super init]) {
        self.animationType = animationType;
    }
    return self;
}

#pragma mark --UIViewControllerTransitioningDelegate

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return self.presentAnimation;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return self.dismissAnimation;
}

#pragma mark --懒加载

- (JYCBasicAnimation *)presentAnimation
{
    if (!_presentAnimation) {
        switch (self.animationType) {
            case JYCTransitionAnimationFlip:
                _presentAnimation = [JYCModalAnimation basicAnimationWithShowType:JYCShowTypePresent];
                break;
            case JYCTransitionAnimationSpress:
                _presentAnimation = [JYCSpressAnimation basicAnimationWithShowType:JYCShowTypePresent];
                break;
            default:
                break;
        }
    }
    return _presentAnimation;
}

- (JYCBasicAnimation *)dismissAnimation
{
    if (!_dismissAnimation) {
        switch (self.animationType) {
            case JYCTransitionAnimationFlip:
                _dismissAnimation = [JYCModalAnimation basicAnimationWithShowType:JYCShowTypeDismiss];
                break;
            case JYCTransitionAnimationSpress:
                _dismissAnimation = [JYCSpressAnimation basicAnimationWithShowType:JYCShowTypeDismiss];
                break;
            default:
                break;
        }
    }
    return _dismissAnimation;
}


@end
