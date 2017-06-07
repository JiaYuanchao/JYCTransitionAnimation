//
//  JYCModalAnimation.m
//  JYCTransitionAnimation
//
//  Created by 贾远潮 on 2017/6/6.
//  Copyright © 2017年 jiayuanchao. All rights reserved.
//

#import "JYCModalAnimation.h"

@interface JYCModalAnimation ()

@property (nonatomic, weak) UIView *toFromTempView;

@end

@implementation JYCModalAnimation

#pragma mark -- UIViewControllerAnimatedTransitioning

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    switch (self.showType) {
        case JYCShowTypePresent:
            [self animationPresent:transitionContext];
            break;
        case JYCShowTypeDismiss:
            [self animationDismiss:transitionContext];
            break;
        default:
            break;
    }
}

- (void)animationPresent:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *tempView = [[UIView alloc] init];
    tempView = [fromVC.view snapshotViewAfterScreenUpdates:NO];
    CGRect fromRect = fromVC.view.frame;
    tempView.frame = fromRect;
    fromVC.view.hidden = YES;
    tempView.layer.zPosition = -tempView.frame.size.height * sin(10.0 / 180.0 * M_PI);
    
    UIView *containView = [transitionContext containerView];
    
    [containView addSubview:tempView];
    [containView addSubview:toVC.view];
    
    
    CGRect finalFrame = [transitionContext finalFrameForViewController:toVC];
    finalFrame.origin.y = 100;
    finalFrame.size.height -= 100;
    
    CGRect begainFrame = CGRectOffset(finalFrame, 0, [UIScreen mainScreen].bounds.size.height);
    toVC.view.frame = begainFrame;
    
    NSTimeInterval animationDuration = [self transitionDuration:transitionContext];
    
    [UIView animateKeyframesWithDuration:animationDuration delay:0 options:UIViewKeyframeAnimationOptionCalculationModeLinear animations:^{
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0.35 animations:^{
            tempView.layer.transform = [self TransitionOne];
        }];
        [UIView addKeyframeWithRelativeStartTime:0.35 relativeDuration:0.65 animations:^{
            tempView.layer.transform = [self transitionTwo];
        }];
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:1 animations:^{
            toVC.view.frame = finalFrame;
        }];
    } completion:^(BOOL finished) {
        NSLog(@"%@",fromVC.view.superview);
        NSLog(@"%@",NSStringFromCGRect(fromVC.view.frame));
//        toVC.view.hidden = YES;
        [transitionContext completeTransition:finished];
    }];
    
}

- (void)animationDismiss:(id<UIViewControllerContextTransitioning>)transitionContext
{

    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containView = [transitionContext containerView];
    
    [containView insertSubview:toVC.view aboveSubview:fromVC.view];
    
    NSArray *subviewsArray = containView.subviews;
//    UIView *tempView = subviewsArray[MIN(subviewsArray.count, MAX(0, subviewsArray.count - 2))];
    UIView *tempView = subviewsArray[0];
    _toFromTempView = tempView;
    
    NSLog(@"tempView = %@",tempView);
    tempView.layer.zPosition = -toVC.view.frame.size.height * sin(10.0 / 180.0 * M_PI);
    CGRect initFrame = [transitionContext initialFrameForViewController:toVC];
    NSLog(@"%@",NSStringFromCGRect(initFrame));
    CGRect finalFrame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    
    NSTimeInterval animationDuration = [self transitionDuration:transitionContext];
    
    [UIView animateKeyframesWithDuration:animationDuration delay:0 options:UIViewKeyframeAnimationOptionCalculationModeLinear animations:^{
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0.35 animations:^{
            NSLog(@"tempView = %@",_toFromTempView);
            _toFromTempView.layer.transform = [self TransitionOne];
        }];
        [UIView addKeyframeWithRelativeStartTime:0.35 relativeDuration:0.65 animations:^{
            NSLog(@"tempView = %@",_toFromTempView);
            _toFromTempView.layer.transform = CATransform3DIdentity;
        }];
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0.5 animations:^{
            toVC.view.layer.transform = CATransform3DIdentity;
            fromVC.view.frame = finalFrame;
        }];
    } completion:^(BOOL finished) {
        toVC.view.hidden = NO;
        [_toFromTempView removeFromSuperview];
        [fromVC.view removeFromSuperview];
        [fromVC removeFromParentViewController];
        NSLog(@"%@",toVC.parentViewController);
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}

- (CATransform3D)TransitionOne
{
    CATransform3D t1 = CATransform3DIdentity;
    t1.m34 = - 1.0 / 500;
    t1 = CATransform3DScale(t1, 0.95, 0.95, 1);
    t1 = CATransform3DRotate(t1, 10.0 / 180.0 * M_PI, 1, 0, 0);
    return t1;
}

- (CATransform3D)transitionTwo
{
    CATransform3D t1 = CATransform3DIdentity;
    t1 = CATransform3DScale(t1, 0.95, 0.95, 1);
    return t1;
}


@end
