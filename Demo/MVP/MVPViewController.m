//
//  MVPViewController.m
//  Demo
//
//  Created by 123 on 2017/6/29.
//  Copyright © 2017年 000. All rights reserved.
//

#import "MVPViewController.h"
#import "BaseView.h"
#import "BaseModel.h"
#import "MVPPresenter.h"

@interface MVPViewController ()

@property (nonatomic, strong) BaseView *baseView;
@property (nonatomic, strong) BaseModel *baseModel;
@property (nonatomic, strong) MVPPresenter *presenter;

@end

@implementation MVPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.presenter.baseView = self.baseView;
    self.presenter.baseModel = self.baseModel;
    self.view.backgroundColor = [UIColor orangeColor];
    
}
//初始化presenter
- (MVPPresenter *)presenter {
    if (!_presenter) {
        _presenter = [[MVPPresenter alloc] init];
    }
    return _presenter;
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
@end
