//
//  JYCViewController.m
//  JYCTransitionAnimation
//
//  Created by 贾远潮 on 2017/6/9.
//  Copyright © 2017年 jiayuanchao. All rights reserved.
//

#import "JYCViewController.h"
#import "JYCFromVC.h"
#import "JYCMagicFromVC.h"

@interface JYCViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSArray *titleArray;

@end

@implementation JYCViewController

- (NSArray *)titleArray
{
    if (!_titleArray) {
        _titleArray = @[@"页面翻转",@"圆点扩散",@"神奇动画"];
    }
    return _titleArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.dataSource = self;
    tableView.delegate = self;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"tableViewCell"];
    [self.view addSubview:tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.titleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tableViewCell" forIndexPath:indexPath];
    cell.textLabel.text = self.titleArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:{
            JYCFromVC *vc = [[JYCFromVC alloc] init];
            vc.type = 0;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 1:{
            JYCFromVC *vc = [[JYCFromVC alloc] init];
            vc.type = 1;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 2:{
            JYCMagicFromVC *vc = [[JYCMagicFromVC alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        default:
            break;
    }
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
