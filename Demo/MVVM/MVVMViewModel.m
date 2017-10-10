//
//  MVVMViewModel.m
//  Demo
//
//  Created by 123 on 2017/6/29.
//  Copyright © 2017年 000. All rights reserved.
//

#import "MVVMViewModel.h"
@interface MVVMViewModel ()
@end
@implementation MVVMViewModel

/**
 绑定数据
 */
- (void)bindViewModel {
    RAC(self.baseView.showLabel, text) = RACObserve(self, viewModelS);
    //实现按钮的状态根据TextField的内容的改变而改变
    RAC(self.baseView.submitButton, enabled) = [RACSignal combineLatest:@[self.baseView.userNameField.rac_textSignal, self.baseView.passwordField.rac_textSignal] reduce:^id(NSString *userName, NSString *password) {
        if (userName.length >= 6 && password.length >= 6) {
            self.baseView.submitButton.backgroundColor = [UIColor redColor];
        }else {
            self.baseView.submitButton.backgroundColor = [UIColor lightGrayColor];
        }
        return @(userName.length >= 6 && password.length >= 6);
    }];
    
    //登录按钮点击
    [[self.baseView.submitButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        NSLog(@"按钮被点击");
        self.baseModel.showString = @"正在登陆，请稍等！！！";
        self.viewModelS = self.baseModel.showString;
    }];
    //返回按钮点击
    [[self.baseView.backBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        UIViewController *vc = [self findViewController:self.baseView.backBtn];
        [vc dismissViewControllerAnimated:YES completion:nil];
    }];
}

/**
 获取视图的控制器
 
 @param sourceView 视图
 @return 控制器
 */
- (UIViewController *)findViewController:(UIView *)sourceView {
    id target=sourceView;
    while (target) {
        target = ((UIResponder *)target).nextResponder;
        if ([target isKindOfClass:[UIViewController class]]) {
            break;
        }
    }
    return target;
}

/**
 设置代理
 */
- (void)setBaseView:(BaseView *)baseView {
    if (_baseView != baseView) {
        _baseView = baseView;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(baseViewTap:)];
        [_baseView addGestureRecognizer:tap];
    }
}
- (void)baseViewTap:(UIGestureRecognizer *)sender {
    [self.baseView endEditing:YES];
}
/**
 设置数据
 */
- (void)setBaseModel:(BaseModel *)baseModel {
    if (_baseModel != baseModel) {
        _baseModel = baseModel;
        //设置标签显示
        self.viewModelS = baseModel.showString;
        [self bindViewModel];
    }
}

@end
