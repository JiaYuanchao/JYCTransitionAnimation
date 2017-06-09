//
//  JYCMagicToVC.m
//  JYCTransitionAnimation
//
//  Created by 贾远潮 on 2017/6/9.
//  Copyright © 2017年 jiayuanchao. All rights reserved.
//

#import "JYCMagicToVC.h"
#define kSizeWidth ([UIScreen mainScreen].bounds.size.width)
#define kSizeHeight ([UIScreen mainScreen].bounds.size.height)


@interface JYCMagicToVC ()

@property (nonatomic, strong) UIImageView *magicImageView;

@end

@implementation JYCMagicToVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"头像详情";
    self.view.backgroundColor = [UIColor blackColor];
    self.magicImageView = [[UIImageView alloc] initWithFrame:CGRectMake((kSizeWidth - 300) / 2.0, 100, 300, 300)];
    self.magicImageView.image = [UIImage imageNamed:self.magicImageName];
    [self.view addSubview:self.magicImageView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
