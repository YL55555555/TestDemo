//
//  MVCViewController.m
//  Demo
//
//  Created by 123 on 2017/6/29.
//  Copyright © 2017年 000. All rights reserved.
//

#import "MVCViewController.h"
#import "BaseView.h"
#import "BaseModel.h"

@interface MVCViewController () <BaseViewDelegate>

@property (nonatomic, strong) BaseView *baseView;
@property (nonatomic, strong) BaseModel *baseModel;

@end

@implementation MVCViewController

- (void)viewDidLoad {
    self.view.backgroundColor = [UIColor greenColor];
    [super viewDidLoad];
    self.baseView.showLabel.text = self.baseModel.showString;
}
/**
 实现代理
 */
- (void)submitButtonClick:(UIButton *)sender {
    self.baseView.showLabel.text = @"正在登录，请稍等！！！";
}
/**
 返回按钮的事件
 */
- (void)btn_Click:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
/**
 初始化view
 */
- (BaseView *)baseView {
    if (!_baseView) {
        _baseView = [[BaseView alloc] initWithFrame:self.view.bounds];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(baseViewTap:)];
        [_baseView addGestureRecognizer:tap];
        //设置代理
        _baseView.delegate = self;
        [self.view addSubview:_baseView];
    }
    return _baseView;
}
/**
 初始化model
 */
- (BaseModel *)baseModel {
    if (!_baseModel) {
        _baseModel = [[BaseModel alloc] init];
        _baseModel.showString = @"亲，请登录";
    }
    return _baseModel;
}

- (void)baseViewTap:(UIGestureRecognizer *)sender {
    [self.baseView endEditing:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
