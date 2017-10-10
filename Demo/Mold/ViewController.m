//
//  ViewController.m
//  Demo
//
//  Created by 123 on 2017/6/29.
//  Copyright © 2017年 000. All rights reserved.
//

#import "ViewController.h"
#import "MVCViewController.h"
#import "MVPViewController.h"
#import "MVVMViewController.h"
#import "RACViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn_MVC = [[UIButton alloc] init];
    [btn_MVC setTitle:@"MVC框架" forState:UIControlStateNormal];
    [btn_MVC setBackgroundColor:[UIColor greenColor]];
    [btn_MVC  addTarget:self action:@selector(btn_Click:) forControlEvents:UIControlEventTouchUpInside];
    btn_MVC.tag = 1;
    btn_MVC.frame = CGRectMake(50, 100, 200, 30);
    [self.view addSubview:btn_MVC];
    
    UIButton *btn_MVP = [[UIButton alloc] init];
    [btn_MVP setTitle:@"MVP框架" forState:UIControlStateNormal];
    [btn_MVP setBackgroundColor:[UIColor orangeColor]];
    [btn_MVP  addTarget:self action:@selector(btn_Click:) forControlEvents:UIControlEventTouchUpInside];
    btn_MVP.tag = 2;
    btn_MVP.frame = CGRectMake(50, 150, 200, 30);
    [self.view addSubview:btn_MVP];
    
    UIButton *btn_MVVM = [[UIButton alloc] init];
    [btn_MVVM setTitle:@"MVVM框架" forState:UIControlStateNormal];
    [btn_MVVM setBackgroundColor:[UIColor grayColor]];
    [btn_MVVM  addTarget:self action:@selector(btn_Click:) forControlEvents:UIControlEventTouchUpInside];
    btn_MVVM.tag = 3;
    btn_MVVM.frame = CGRectMake(50, 200, 200, 30);
    [self.view addSubview:btn_MVVM];
    
    UIButton *btn_RAC = [[UIButton alloc] init];
    [btn_RAC setTitle:@"RAC使用" forState:UIControlStateNormal];
    [btn_RAC setBackgroundColor:[UIColor blueColor]];
    [btn_RAC  addTarget:self action:@selector(btn_Click:) forControlEvents:UIControlEventTouchUpInside];
    btn_RAC.tag = 4;
    btn_RAC.frame = CGRectMake(50, 250, 200, 30);
    [self.view addSubview:btn_RAC];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)btn_Click:(UIButton *)sender {
    UIViewController *VC;
    if (sender.tag == 1) {
        VC = [[MVCViewController alloc] init];
    }else if (sender.tag == 2) {
        VC = [[MVPViewController alloc] init];
    }else if (sender.tag == 3) {
        VC = [[MVVMViewController alloc] init];
    }else if (sender.tag == 4) {
        VC = [[RACViewController alloc] init];
    }
    [self presentViewController:VC animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
