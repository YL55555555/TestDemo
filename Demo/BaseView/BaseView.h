//
//  BaseView.h
//  Demo
//
//  Created by 123 on 2017/6/29.
//  Copyright © 2017年 000. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BaseViewDelegate <NSObject>

@optional
- (void)submitButtonClick:(UIButton *)sender;
- (void)btn_Click:(UIButton *)sender;

@end


@interface BaseView : UIView

/** 声明代理 */
@property (nonatomic, weak) id<BaseViewDelegate>  delegate;

@property (nonatomic, strong) UITextField *userNameField;
@property (nonatomic, strong) UITextField *passwordField;
@property (nonatomic, strong) UILabel *showLabel;
@property (nonatomic, strong) UIButton *submitButton;
@property (nonatomic, strong) UIButton *backBtn;

@end
