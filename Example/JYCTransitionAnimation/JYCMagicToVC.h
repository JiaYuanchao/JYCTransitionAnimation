//
//  JYCMagicToVC.h
//  JYCTransitionAnimation
//
//  Created by 贾远潮 on 2017/6/9.
//  Copyright © 2017年 jiayuanchao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JYCMagicToVC : UIViewController<UINavigationControllerDelegate>

@property (nonatomic, strong) NSString *magicImageName;

@property (nonatomic, strong, readonly) UIImageView *magicImageView;

@end
