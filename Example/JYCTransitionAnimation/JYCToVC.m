//
//  JYCToVC.m
//  JYCTransitionAnimation
//
//  Created by 贾远潮 on 2017/6/6.
//  Copyright © 2017年 jiayuanchao. All rights reserved.
//

#import "JYCToVC.h"
#import "JYCTransitionAnimationManager.h"

@interface JYCToVC ()

@property (nonatomic, strong) JYCTransitionAnimationManager *manager;

@end

@implementation JYCToVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor purpleColor];
    
    UIButton *redButton1 = [UIButton buttonWithType:UIButtonTypeSystem];
    redButton1.frame = CGRectMake(250, 100, 100, 100);
    redButton1.backgroundColor = [UIColor redColor];
    [redButton1 addTarget:self action:@selector(redButton1Action:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:redButton1];

    
    UIButton *redButton = [UIButton buttonWithType:UIButtonTypeSystem];
    redButton.frame = CGRectMake(100, 100, 100, 100);
    redButton.backgroundColor = [UIColor redColor];
    [redButton addTarget:self action:@selector(redButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:redButton];

}

- (void)redButton1Action:(UIButton *)sender
{
    NSLog(@"btn");
    JYCToVC *toVC = [[JYCToVC alloc] init];
    toVC.transitioningDelegate = self.manager;
    [self presentViewController:toVC animated:YES completion:nil];
}


- (void)redButtonAction:(UIButton *)sender
{
    NSLog(@"btn");
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (JYCTransitionAnimationManager *)manager
{
    if (!_manager) {
        _manager = [JYCTransitionAnimationManager transitionAnimationManagerWithAninationType:JYCTransitionAnimationNone];
    }
    return _manager;
}

- (void)dealloc
{
    NSLog(@"第二个控制器被销毁");
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
