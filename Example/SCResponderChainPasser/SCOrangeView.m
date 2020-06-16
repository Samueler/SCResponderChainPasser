//
//  SCOrangeView.m
//  SCResponderChainPasser_Example
//
//  Created by ty.Chen on 2020/6/16.
//  Copyright © 2020 Samueler. All rights reserved.
//

#import "SCOrangeView.h"
#import <UIResponder+SCResponderChainPasser.h>

NSString *const kOrangeViewRedBtnClickActionNoParamater = @"kOrangeViewRedBtnClickActionNoParamater";
NSString *const kOrangeViewRedBtnClickActionOneParamater = @"kOrangeViewRedBtnClickActionOneParamater";
NSString *const kOrangeViewRedBtnClickActionOneNilParamater = @"kOrangeViewRedBtnClickActionOneNilParamater";
NSString *const kOrangeViewRedBtnClickActionParamaters = @"kOrangeViewRedBtnClickActionParamaters";
NSString *const kOrangeViewRedBtnClickActionParamatersContainNil = @"kOrangeViewRedBtnClickActionParamatersContainNil";

@implementation SCOrangeView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
        btn.backgroundColor = [UIColor redColor];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
    }
    return self;
}

#pragma mark - Events

- (void)btnClick:(UIButton *)btn {
    [self routeEventForName:kOrangeViewRedBtnClickActionNoParamater];
    [self routeEventForName:kOrangeViewRedBtnClickActionOneParamater paramater:btn];
    [self routeEventForName:kOrangeViewRedBtnClickActionOneNilParamater paramater:nil];
    btn.tag = 10;
    [self routeEventForName:kOrangeViewRedBtnClickActionParamaters paramaters:@[btn, @(btn.tag), @(btn.frame.size), @(btn.frame)]];
    [self routeEventForName:kOrangeViewRedBtnClickActionParamatersContainNil paramaters:@[btn, SCNotNilObject(nil)]];
}

@end
