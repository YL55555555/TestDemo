//
//  MVPPresenter.m
//  Demo
//
//  Created by 123 on 2017/6/29.
//  Copyright © 2017年 000. All rights reserved.
//

#import "MVPPresenter.h"
@interface MVPPresenter () <BaseViewDelegate>
@end

@implementation MVPPresenter

/**
 实现代理
 */
- (void)submitButtonClick:(UIButton *)sender {
    self.baseView.showLabel.text = @"正在登陆，请稍等！！！";
}

/**
 返回按钮功能的实现
 */
- (void)btn_Click:(UIButton *)sender {
    UIViewController *vc = [self findViewController:sender];
    [vc dismissViewControllerAnimated:YES completion:nil];
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
        //设置代理
        _baseView.delegate = self;
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
        self.baseView.showLabel.text = baseModel.showString;
    }
}
@end
