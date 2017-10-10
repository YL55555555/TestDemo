//
//  MVVMViewController.m
//  Demo
//
//  Created by 123 on 2017/6/29.
//  Copyright © 2017年 000. All rights reserved.
//

#import "MVVMViewController.h"
#import "BaseView.h"
#import "BaseModel.h"
#import "MVVMViewModel.h"

@interface MVVMViewController ()

@property (nonatomic, strong) BaseView *baseView;
@property (nonatomic, strong) BaseModel *baseModel;
@property (nonatomic, strong) MVVMViewModel *viewModel;

@end

@implementation MVVMViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
    self.viewModel.baseView = self.baseView;
    self.viewModel.baseModel = self.baseModel;
}
//初始化viewModel
- (MVVMViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[MVVMViewModel alloc] init];
    }
    return _viewModel;
}
//初始化view
- (BaseView *)baseView {
    if (!_baseView) {
        _baseView = [[BaseView alloc] initWithFrame:self.view.bounds];
        [self.view addSubview:_baseView];
    }
    return _baseView;
}
//初始化model
- (BaseModel *)baseModel {
    if (!_baseModel) {
        _baseModel = [[BaseModel alloc] init];
        _baseModel.showString = @"亲，请登陆";
    }
    return _baseModel;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
