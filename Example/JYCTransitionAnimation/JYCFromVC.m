//
//  JYCFromVC.m
//  JYCTransitionAnimation
//
//  Created by 贾远潮 on 2017/6/6.
//  Copyright © 2017年 jiayuanchao. All rights reserved.
//

#import "JYCFromVC.h"
#import "JYCToVC.h"
#import "JYCTransitionAnimationManager.h"
@interface JYCFromVC ()

@property (nonatomic, strong) UIButton *clirlButton;

@property (nonatomic, strong) JYCTransitionAnimationManager *manager;

@end

@implementation JYCFromVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor orangeColor];
    self.navigationItem.title = @"第一个控制器";
    self.clirlButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.clirlButton.frame = CGRectMake(100, 100, 100, 100);
    self.clirlButton.layer.cornerRadius = 50;
    self.clirlButton.clipsToBounds = YES;
    self.clirlButton.backgroundColor = [UIColor redColor];
    [self.clirlButton addTarget:self action:@selector(redButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.clirlButton];
}

- (void)redButtonAction:(UIButton *)sender
{
    NSLog(@"btn");
    JYCToVC *toVC = [[JYCToVC alloc] init];
    toVC.transitioningDelegate = self.manager;
    [self presentViewController:toVC animated:YES completion:nil];
}

- (JYCTransitionAnimationManager *)manager
{
    if (!_manager) {
        _manager = [JYCTransitionAnimationManager transitionAnimationManagerWithAninationType:self.type == 0 ? JYCTransitionAnimationFlip : JYCTransitionAnimationSpress];
    }
    return _manager;
}

- (CGRect)buttonFrame
{
    NSLog(@"%@",self.clirlButton);
    return self.clirlButton.frame;
}

- (void)dealloc
{
    NSLog(@"第一个控制器被销毁");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
