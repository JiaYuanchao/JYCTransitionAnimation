//
//  JYCFromVC.h
//  JYCTransitionAnimation
//
//  Created by 贾远潮 on 2017/6/6.
//  Copyright © 2017年 jiayuanchao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JYCFromVC : UIViewController

@property (nonatomic, assign, readonly) CGRect buttonFrame;


/**
 种类 0 翻转 1 扩散
 */
@property (nonatomic, assign) NSInteger type;

@end
