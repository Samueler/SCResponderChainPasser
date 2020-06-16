//
//  SCTestEventProxy.m
//  SCResponderChainPasser_Example
//
//  Created by ty.Chen on 2020/6/16.
//  Copyright © 2020 Samueler. All rights reserved.
//

#import "SCTestEventProxy.h"

extern NSString *const kOrangeViewRedBtnClickActionNoParamater;
extern NSString *const kOrangeViewRedBtnClickActionOneParamater;
extern NSString *const kOrangeViewRedBtnClickActionOneNilParamater;
extern NSString *const kOrangeViewRedBtnClickActionParamaters;
extern NSString *const kOrangeViewRedBtnClickActionParamatersContainNil;

@implementation SCTestEventProxy

#pragma mark - Events

- (void)orangeViewRedBtnClick {
    NSLog(@"kOrangeViewRedBtnClickActionNoParamater");
}

- (void)orangeViewRedBtnClick:(UIButton *)btn {
    NSLog(@"kOrangeViewRedBtnClickActionOneParamater\n%@", btn);
}

- (void)orangeViewRedBtnClickWithNilParamater:(id)paramater {
    NSLog(@"kOrangeViewRedBtnClickActionOneNilParamater\n%@", paramater);
}

- (void)orangeViewRedBtnClick:(UIButton *)btn tag:(NSInteger)tag size:(CGSize)size rect:(CGRect)rect {
    NSLog(@"kOrangeViewRedBtnClickActionParamaters\nbtn:%@\ntag:%ld\nsize:%@\nrect:%@", btn, (long)tag, NSStringFromCGSize(size), NSStringFromCGRect(rect));
}

- (void)orangeViewRedBtnClickWithParamatersContainNil:(UIButton *)btn nilParamater:(id)paramater {
    NSLog(@"kOrangeViewRedBtnClickActionParamatersContainNil\n%@ %@", btn, paramater);
}

#pragma mark - Getter

- (NSDictionary<NSString *,NSInvocation *> *)eventStrategy {
    return @{
        kOrangeViewRedBtnClickActionNoParamater:
            [self createInvocationForSelector:@selector(orangeViewRedBtnClick)],
        
        kOrangeViewRedBtnClickActionOneParamater:
            [self createInvocationForSelector:@selector(orangeViewRedBtnClick:)],
        
        kOrangeViewRedBtnClickActionOneNilParamater:
            [self createInvocationForSelector:@selector(orangeViewRedBtnClickWithNilParamater:)],
        
        kOrangeViewRedBtnClickActionParamaters:
            [self createInvocationForSelector:@selector(orangeViewRedBtnClick:tag:size:rect:)],
        
        kOrangeViewRedBtnClickActionParamatersContainNil:
            [self createInvocationForSelector:@selector(orangeViewRedBtnClickWithParamatersContainNil:nilParamater:)],
    };
}

@end
