//
//  JYCSpressAnimation.m
//  JYCTransitionAnimation
//
//  Created by 贾远潮 on 2017/6/7.
//  Copyright © 2017年 jiayuanchao. All rights reserved.
//

#import "JYCSpressAnimation.h"

@interface JYCSpressAnimation ()<CAAnimationDelegate>


@end

@implementation JYCSpressAnimation

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
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].childViewControllers.lastObject;
    
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];
    
    [containerView addSubview:toVC.view];
    
    CGRect buttonFrame = CGRectFromString([NSString stringWithFormat:@"%@",[fromVC valueForKey:@"buttonFrame"]]);
    
    UIBezierPath *startPath = [UIBezierPath bezierPathWithOvalInRect:buttonFrame];
    NSLog(@"%@",NSStringFromCGRect(buttonFrame));
    NSLog(@"%@",startPath);
    CGFloat xLenght = MAX(CGRectGetMidX(buttonFrame), [UIScreen mainScreen].bounds.size.width - CGRectGetMidX(buttonFrame));
    CGFloat yLenght = MAX(CGRectGetMidY(buttonFrame), [UIScreen mainScreen].bounds.size.height - CGRectGetMidY(buttonFrame));
    CGFloat radiusMax = sqrtf(pow(xLenght, 2) + pow(yLenght, 2));
    UIBezierPath *endPath = [UIBezierPath bezierPathWithArcCenter:containerView.center radius:radiusMax startAngle:0 endAngle:M_PI * 2 clockwise:YES];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = endPath.CGPath;
    toVC.view.layer.mask = shapeLayer;
    
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    pathAnimation.fromValue = (__bridge id)(startPath.CGPath);
    pathAnimation.toValue = (__bridge id)(endPath.CGPath);
    pathAnimation.duration = [self transitionDuration:transitionContext];
    pathAnimation.delegate = self;
    [pathAnimation setValue:transitionContext forKey:@"transitionContext"];
    
    [shapeLayer addAnimation:pathAnimation forKey:@"pathAnimation"];
    
}

- (void)animationDismiss:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey].childViewControllers.lastObject;
    
    UIView *containerView = [transitionContext containerView];
    
    CGRect buttonFrame = CGRectFromString([NSString stringWithFormat:@"%@",[toVC valueForKey:@"buttonFrame"]]);
    
    UIBezierPath *startPath = [UIBezierPath bezierPathWithOvalInRect:buttonFrame];
    CGFloat xLenght = MAX(CGRectGetMidX(buttonFrame), containerView.bounds.size.width - CGRectGetMidX(buttonFrame));
    CGFloat yLenght = MAX(CGRectGetMidY(buttonFrame), containerView.bounds.size.height - CGRectGetMidY(buttonFrame));
    CGFloat radiusMax = sqrtf(pow(xLenght, 2) + pow(yLenght, 2));
    UIBezierPath *endPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(CGRectGetMidX(buttonFrame), CGRectGetMidY(buttonFrame)) radius:radiusMax startAngle:0 endAngle:M_PI * 2 clockwise:YES];
    
    CAShapeLayer *shapeLayer = [[CAShapeLayer alloc] init];
    shapeLayer.path = startPath.CGPath;
    fromVC.view.layer.mask = shapeLayer;
    
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    pathAnimation.fromValue = (__bridge id)(endPath.CGPath);
    pathAnimation.toValue = (__bridge id)(startPath.CGPath);
    pathAnimation.duration = [self transitionDuration:transitionContext];
    pathAnimation.delegate = self;
    [pathAnimation setValue:transitionContext forKey:@"transitionContext"];
    
    [shapeLayer addAnimation:pathAnimation forKey:@"pathAnimation"];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    switch (self.showType) {
        case JYCShowTypePresent:
        {
            id<UIViewControllerContextTransitioning> transitionContext = [anim valueForKey:@"transitionContext"];
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        }
            break;
        case JYCShowTypeDismiss:
        {
            id<UIViewControllerContextTransitioning> transitionContext = [anim valueForKey:@"transitionContext"];
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        }
            break;
        default:
            break;
    }
}

@end
