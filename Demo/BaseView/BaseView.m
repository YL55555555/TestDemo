//
//  BaseView.m
//  Demo
//
//  Created by 123 on 2017/6/29.
//  Copyright © 2017年 000. All rights reserved.
//

#import "BaseView.h"

@implementation BaseView
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self userNameField];
        [self passwordField];
        [self submitButton];
        [self showLabel];
        [self backBtn];
    }
    return self;
}
/**
 登陆按钮的代理
 */
- (void)submitButtonClick:(UIButton *)sender {
    //把事件传递给代理
    if (_delegate && [_delegate respondsToSelector:@selector(submitButtonClick:)]) {
        [_delegate submitButtonClick:sender];
    }
}

/**
 返回按钮的代理
 */
- (void)btn_Click:(UIButton *)sender {
    //把事件传递给代理
    if (_delegate && [_delegate respondsToSelector:@selector(btn_Click:)]) {
        [_delegate btn_Click:sender];
    }
}

/**
 按钮可点判断
 */
- (void)textFieldTextDidChange:(UITextField *)sender {
    if (_userNameField.text.length > 6 && _passwordField.text.length > 6) {
        _submitButton.enabled = YES;
        _submitButton.backgroundColor = [UIColor redColor];
    }else {
        _submitButton.enabled = NO;
        _submitButton.backgroundColor = [UIColor lightGrayColor];
    }
}
- (UILabel *)showLabel {
    if (!_showLabel) {
        _showLabel = [[UILabel alloc] init];
        _showLabel.frame = CGRectMake(20, 250, self.bounds.size.width - 40, 44);
        _showLabel.textAlignment = NSTextAlignmentCenter;
        [_showLabel setTextColor:[UIColor redColor]];
        [self addSubview:_showLabel];
    }
    return _showLabel;
}
- (UIButton *)submitButton {
    if (!_submitButton) {
        _submitButton = [[UIButton alloc] init];
        _submitButton.frame = CGRectMake(20, 300, self.bounds.size.width - 40, 44);
        [_submitButton setTitle:@"登录" forState:UIControlStateNormal];
        _submitButton.enabled = NO;
        if (_submitButton.enabled) {
            _submitButton.backgroundColor = [UIColor redColor];
        }else {
            _submitButton.backgroundColor = [UIColor lightGrayColor];
        }
        [_submitButton addTarget:self action:@selector(submitButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_submitButton];
    }
    return _submitButton;
}
- (UITextField *)userNameField {
    if (!_userNameField) {
        _userNameField = [[UITextField alloc] init];
        _userNameField.frame = CGRectMake(20, 100, self.bounds.size.width - 40, 44);
        _userNameField.placeholder = @"请输入账户";
        _userNameField.layer.cornerRadius = 10.0;//2.0是圆角的弧度，根据需求自己更改
        _userNameField.layer.borderColor = [UIColor blackColor].CGColor;//设置边框颜色
        _userNameField.layer.borderWidth = 1.0f;//设置边框颜色
        _userNameField.layer.masksToBounds = YES;
        [_userNameField addTarget:self action:@selector(textFieldTextDidChange:) forControlEvents:UIControlEventEditingChanged];
        _userNameField.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_userNameField];
    }
    return _userNameField;
}

- (UITextField *)passwordField {
    if (!_passwordField) {
        _passwordField = [[UITextField alloc] init];
        _passwordField.frame = CGRectMake(20, 150, self.bounds.size.width - 40, 44);
        _passwordField.layer.cornerRadius = 10.0;//2.0是圆角的弧度，根据需求自己更改
        _passwordField.layer.borderColor = [UIColor blackColor].CGColor;//设置边框颜色
        _passwordField.layer.borderWidth = 1.0f;//设置边框颜色
        _passwordField.layer.masksToBounds = YES;
        _passwordField.textAlignment = NSTextAlignmentCenter;
        [_passwordField addTarget:self action:@selector(textFieldTextDidChange:) forControlEvents:UIControlEventEditingChanged];
        _passwordField.placeholder = @"请输入密码";
        [self addSubview:_passwordField];
    }
    return _passwordField;
}

- (UIButton *)backBtn {
    if (!_backBtn) {
        _backBtn = [[UIButton alloc] init];
        [_backBtn setTitle:@"返回" forState:UIControlStateNormal];
        [_backBtn setBackgroundColor:[UIColor redColor]];
        [_backBtn  addTarget:self action:@selector(btn_Click:) forControlEvents:UIControlEventTouchUpInside];
        _backBtn.frame = CGRectMake(20, 20, self.bounds.size.width - 40, 30);
        [self addSubview:_backBtn];
    }
    return _backBtn;
}

@end
