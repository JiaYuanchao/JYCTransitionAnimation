//
//  JYCMagicFromVC.m
//  JYCTransitionAnimation
//
//  Created by 贾远潮 on 2017/6/9.
//  Copyright © 2017年 jiayuanchao. All rights reserved.
//

#import "JYCMagicFromVC.h"
#import "JYCMagicCell.h"
#import "JYCMagicToVC.h"
#import "JYCTransitionAnimationManager.h"

@interface JYCMagicFromVC ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, strong) UICollectionView *magicCV;

@property (nonatomic, strong) NSArray *magicImageArray;

@property (nonatomic, strong) JYCTransitionAnimationManager *manager;

@end

@implementation JYCMagicFromVC

- (NSArray *)magicImageArray
{
    if (!_magicImageArray) {
        _magicImageArray = @[@"1",@"2",@"3",@"4"];
    }
    return _magicImageArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"头像列表";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.magicCV];
    self.navigationItem.leftBarButtonItem = ({
        UIBarButtonItem *cancelBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(resetNavigation)];
        cancelBarButtonItem;
    });
}

- (void)resetNavigation
{
    self.navigationController.delegate = nil;
    [self.navigationController popViewControllerAnimated:YES];
}

- (UICollectionView *)magicCV
{
    if (!_magicCV) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.itemSize = CGSizeMake(150, 150);
        
        _magicCV = [[UICollectionView alloc] initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:flowLayout];
//        _magicCV.backgroundColor = [UIColor whiteColor];
        [_magicCV registerClass:[JYCMagicCell class] forCellWithReuseIdentifier:@"magicCell"];
        _magicCV.dataSource = self;
        _magicCV.delegate = self;
    }
    return _magicCV;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.magicImageArray.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    JYCMagicCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"magicCell" forIndexPath:indexPath];
    cell.magicSmallImageView.image = [UIImage imageNamed:self.magicImageArray[indexPath.row]];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    self.currentIndexPath = indexPath;
    JYCMagicToVC *toVC = [[JYCMagicToVC alloc] init];
    toVC.magicImageName = self.magicImageArray[indexPath.row];
    self.navigationController.delegate = self.manager;
    NSLog(@"%@",self.manager);
    [self.navigationController pushViewController:toVC animated:YES];
}

- (JYCTransitionAnimationManager *)manager
{
    if (!_manager) {
        _manager = [JYCTransitionAnimationManager transitionAnimationManagerWithAninationType:JYCTransitionAnimationMagicMove];
    }
    return _manager;
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
