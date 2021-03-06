//
//  JYCTransitionAnimationManager.h
//  JYCTransitionAnimation
//
//  Created by 贾远潮 on 2017/6/6.
//  Copyright © 2017年 jiayuanchao. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, JYCTransitionAnimation) {
    JYCTransitionAnimationNone,
    JYCTransitionAnimationFlip,
    JYCTransitionAnimationSpress,
    JYCTransitionAnimationMagicMove,
};

@interface JYCTransitionAnimationManager : NSObject<UIViewControllerTransitioningDelegate,UINavigationControllerDelegate>

+ (__kindof JYCTransitionAnimationManager *)transitionAnimationManagerWithAninationType:(JYCTransitionAnimation)animationType;

@end
