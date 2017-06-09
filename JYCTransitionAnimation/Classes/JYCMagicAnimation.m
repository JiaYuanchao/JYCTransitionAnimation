//
//  JYCMagicAnimation.m
//  Pods
//
//  Created by 贾远潮 on 2017/6/9.
//
//

#import "JYCMagicAnimation.h"

@implementation JYCMagicAnimation

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    switch (self.showType) {
        case JYCShowTypePush:
            [self animationPush:transitionContext];
            break;
        case JYCShowTypePop:
            [self animationPop:transitionContext];
            break;
        default:
            break;
    }
}

- (void)animationPush:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];
    
    UICollectionView *magicCV = [fromVC valueForKey:@"magicCV"];
    NSIndexPath *currentIndexPath = [fromVC valueForKey:@"currentIndexPath"];
    UIImageView *cellImageView = [[magicCV cellForItemAtIndexPath:currentIndexPath] valueForKey:@"magicSmallImageView"];
    
    UIImageView *toViewImageView = [toVC valueForKey:@"magicImageView"];
    
    UIView *tempView = [cellImageView snapshotViewAfterScreenUpdates:NO];
    
    CGRect startRect = [cellImageView convertRect:cellImageView.bounds toView:containerView];
    tempView.frame = startRect;
    
    [containerView addSubview:toVC.view];
    [containerView addSubview:tempView];
    
    toViewImageView.hidden = YES;
    toVC.view.alpha = 0;
    
    CGRect endRect = [toViewImageView convertRect:toViewImageView.bounds toView:containerView];
    
    NSTimeInterval animationDuration = [self transitionDuration:transitionContext];
    
    [UIView animateWithDuration:animationDuration animations:^{
        tempView.frame = endRect;
        toVC.view.alpha = 1.0;
    } completion:^(BOOL finished) {
        tempView.hidden = YES;
        toViewImageView.hidden = NO;
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
    
    
}

- (void)animationPop:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];

    UICollectionView *magicCV = [toVC valueForKey:@"magicCV"];
    NSIndexPath *currentIndexPath = [toVC valueForKey:@"currentIndexPath"];
    UIImageView *cellImageView = [[magicCV cellForItemAtIndexPath:currentIndexPath] valueForKey:@"magicSmallImageView"];
    
    UIImageView *fromViewImageView = [fromVC valueForKey:@"magicImageView"];
    
    UIView *tempView = containerView.subviews.lastObject;
    NSLog(@"%@",tempView);
    CGRect endRect = [cellImageView convertRect:cellImageView.bounds toView:containerView];
    
    tempView.hidden = NO;
    fromViewImageView.hidden = YES;
    
    [containerView insertSubview:toVC.view atIndex:0];
    
    NSTimeInterval animationDuration = [self transitionDuration:transitionContext];
    
    [UIView animateWithDuration:animationDuration animations:^{
        tempView.frame = endRect;
        fromVC.view.alpha = 0;
    } completion:^(BOOL finished) {
        [fromVC.view removeFromSuperview];
        tempView.hidden = YES;
        [tempView removeFromSuperview];
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];

}


@end
