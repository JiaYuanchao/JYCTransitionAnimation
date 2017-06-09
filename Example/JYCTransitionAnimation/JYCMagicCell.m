//
//  JYCMagicCell.m
//  JYCTransitionAnimation
//
//  Created by 贾远潮 on 2017/6/9.
//  Copyright © 2017年 jiayuanchao. All rights reserved.
//

#import "JYCMagicCell.h"

@interface JYCMagicCell ()

@property (nonatomic, strong) UIImageView *magicSmallImageView;

@end

@implementation JYCMagicCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.magicSmallImageView];
    }
    return self;
}

- (UIImageView *)magicSmallImageView
{
    if (!_magicSmallImageView) {
        _magicSmallImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 150, 150)];
    }
    return _magicSmallImageView;
}

@end
