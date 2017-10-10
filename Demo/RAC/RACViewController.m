//
//  RACViewController.m
//  MVVM_RAC_Demo
//
//  Created by 123 on 2017/6/28.
//  Copyright © 2017年 000. All rights reserved.
//

#import "RACViewController.h"

@interface RACViewController ()

@property (nonatomic, strong) UITextField *userNameField;
@property (nonatomic, strong) UITextField *passwordField;
@property (nonatomic, strong) UILabel *showLabel;
@property (nonatomic, strong) UIButton *submitButton;
@property (nonatomic, strong) UIButton *backBtn;

@end

@implementation RACViewController

- (void)viewDidLoad {
    self.view.backgroundColor = [UIColor whiteColor];
    [super viewDidLoad];
    [self userNameField];
    [self passwordField];
    [self submitButton];
    [self showLabel];
    [self backBtn];
    //监听TextField内容的改变
    [[self.userNameField rac_signalForControlEvents:UIControlEventEditingChanged] subscribeNext:^(id x){
        NSLog(@"change");
    }];
    //监听label的text
    [RACObserve(self.showLabel, text) subscribeNext:^(NSString *newName) {
        NSLog(@"%@", newName);
    }];
    //实现只有当名字以'j'开头，才会被记录
    [[RACObserve(self.showLabel,text)
      filter:^(NSString *newName) {
          return [newName hasPrefix:@"j"];
      }]
     subscribeNext:^(NSString *newName) {
         NSLog(@"%@", newName);
     }];
    //实现按钮的状态根据TextField的内容的改变而改变
    RAC(self.submitButton, enabled) = [RACSignal combineLatest:@[self.userNameField.rac_textSignal, self.passwordField.rac_textSignal] reduce:^id(NSString *userName, NSString *password) {
        if (userName.length >= 6 && password.length >= 6) {
            _submitButton.backgroundColor = [UIColor redColor];
        }else {
            _submitButton.backgroundColor = [UIColor lightGrayColor];
        }
        return @(userName.length >= 6 && password.length >= 6);
    }];
    
    
}
- (void)doTest
{
    RACSubject *subject = [self doRequest];
    
    [subject subscribeNext:^(NSString *value){
        NSLog(@"value:%@", value);
    }];
}

- (RACSubject *)doRequest
{
    RACSubject *subject = [RACSubject subject];
    // 模拟2秒后得到请求内容
    // 只触发1次
    // 尽管subscribeNext什么也没做，但如果没有的话map是不会执行的
    // subscribeNext就是定义了一个接收体
    [[[[RACSignal interval:2 onScheduler:nil] take:1] map:^id(id _){
        // the value is from url request
        NSString *value = @"content fetched from web";
        [subject sendNext:value];
        return nil;
    }] subscribeNext:^(id _){}];
    return subject;
}
- (void)submitButtonClick:(UIButton *)sender {
    [_showLabel setText:@"j名称"];
    NSLog(@"<><><><><><><>");
}
- (void)btn_Click:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (UIButton *)backBtn {
    if (!_backBtn) {
        _backBtn = [[UIButton alloc] init];
        [_backBtn setTitle:@"返回" forState:UIControlStateNormal];
        [_backBtn setBackgroundColor:[UIColor redColor]];
        [_backBtn  addTarget:self action:@selector(btn_Click:) forControlEvents:UIControlEventTouchUpInside];
        _backBtn.frame = CGRectMake(20, 20, self.view.bounds.size.width - 40, 30);
        [self.view addSubview:_backBtn];
    }
    return _backBtn;
}
- (UILabel *)showLabel {
    if (!_showLabel) {
        _showLabel = [[UILabel alloc] init];
        _showLabel.frame = CGRectMake(20, 250, self.view.bounds.size.width - 40, 44);
        [_showLabel setText:@"你好名称"];
        _showLabel.textAlignment = NSTextAlignmentCenter;
        [_showLabel setTextColor:[UIColor redColor]];
        [self.view addSubview:_showLabel];
    }
    return _showLabel;
}
- (UIButton *)submitButton {
    if (!_submitButton) {
        _submitButton = [[UIButton alloc] init];
        _submitButton.frame = CGRectMake(20, 300, self.view.bounds.size.width - 40, 44);
        [_submitButton setTitle:@"登录" forState:UIControlStateNormal];
        _submitButton.enabled = NO;
        if (_submitButton.enabled) {
            _submitButton.backgroundColor = [UIColor redColor];
        }else {
            _submitButton.backgroundColor = [UIColor lightGrayColor];
        }
        [_submitButton addTarget:self action:@selector(submitButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_submitButton];
    }
    return _submitButton;
}
- (UITextField *)userNameField {
    if (!_userNameField) {
        _userNameField = [[UITextField alloc] init];
        _userNameField.frame = CGRectMake(20, 100, self.view.bounds.size.width - 40, 44);
        _userNameField.placeholder = @"账户";
        
        _userNameField.layer.cornerRadius = 10.0;//2.0是圆角的弧度，根据需求自己更改
        _userNameField.layer.borderColor = [UIColor blackColor].CGColor;//设置边框颜色
        _userNameField.layer.borderWidth = 1.0f;//设置边框颜色
        _userNameField.layer.masksToBounds = YES;
        
        _userNameField.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:_userNameField];
    }
    return _userNameField;
}

- (UITextField *)passwordField {
    if (!_passwordField) {
        _passwordField = [[UITextField alloc] init];
        _passwordField.frame = CGRectMake(20, 150, self.view.bounds.size.width - 40, 44);
        
        _passwordField.layer.cornerRadius = 10.0;//2.0是圆角的弧度，根据需求自己更改
        _passwordField.layer.borderColor = [UIColor blackColor].CGColor;//设置边框颜色
        _passwordField.layer.borderWidth = 1.0f;//设置边框颜色
        _passwordField.layer.masksToBounds = YES;
        
        _passwordField.textAlignment = NSTextAlignmentCenter;
        _passwordField.placeholder = @"密码";
        [self.view addSubview:_passwordField];
    }
    return _passwordField;
}

@end
