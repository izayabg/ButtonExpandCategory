//
//  ViewController.m
//  buttonRange
//
//  Created by 战场原黑仪 on 2018/5/10.
//  Copyright © 2018年 战场原黑仪. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+Expend.h"

@interface ViewController ()

@property(nonatomic, strong)UIButton *button;

@end

@implementation ViewController

static int money;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    money = 1;
    self.button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 150, 60)];
    [self.button setTitle:@"点一下玩一年" forState:UIControlStateNormal];
    self.button.center = self.view.center;
    self.button.backgroundColor = [UIColor redColor];
    [self.button expandSize:CGRectMake(0, 0, 200, 100)];
    [self.button addTarget:self action:@selector(didClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.button];
    
}

- (void)didClick {
    
    [self.button setTitle:[NSString stringWithFormat:@"装备不花%d分钱", money] forState:UIControlStateNormal];
    money++;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
