//
//  MVPPresenter.h
//  Demo
//
//  Created by 123 on 2017/6/29.
//  Copyright © 2017年 000. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseView.h"
#import "BaseModel.h"

@interface MVPPresenter : NSObject

@property (nonatomic, strong) BaseView *baseView;
@property (nonatomic, strong) BaseModel *baseModel;

@end
