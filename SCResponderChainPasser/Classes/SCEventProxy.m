//
//  SCEventProxy.m
//  SCResponderChainPasser
//
//  Created by ty.Chen on 2020/6/16.
//

#import "SCEventProxy.h"
#import "NSInvocation+SCWrap.h"

@implementation SCEventProxy

- (void)handleEventProxyForEvent:(NSString *)eventName {
    NSInvocation *invocation = [self.eventStrategy valueForKey:eventName];
    if (invocation.methodSignature.numberOfArguments - 2 > 0) {
        NSString *errorTip = [NSString stringWithFormat:@"eventName:%@\n 参数个数不匹配,该方法仅适用于无参数的方法：invocation numberOfArguments:%zd", eventName, invocation.methodSignature.numberOfArguments - 2];
        NSAssert(NO, errorTip);
        return;
    }
    [invocation invoke];
}

- (void)handleEventProxyForEvent:(NSString *)eventName paramaters:(NSArray *)paramaters {
    [self handleEventProxyForEvent:eventName paramaters:paramaters needWrap:YES];
}

- (void)handleEventProxyForEvent:(NSString *)eventName paramaters:(NSArray *)paramaters needWrap:(BOOL)needWrap {
    NSInvocation *invocation = [self.eventStrategy valueForKey:eventName];
    if (invocation.methodSignature.numberOfArguments - 2 != paramaters.count && paramaters) {
        NSString *errorTip = [NSString stringWithFormat:@"eventName:%@\n参数个数不匹配: invocation numberOfArguments:%zd, paramaters count:%zd", eventName,  invocation.methodSignature.numberOfArguments - 2, paramaters.count];
        NSAssert(NO, errorTip);
        return;
    }
    [invocation sc_wrapAndSetArguments:paramaters needWrap:needWrap];
    [invocation invoke];
}

- (NSInvocation *)createInvocationForSelector:(SEL)selector {
    NSMethodSignature *methodSignature = [self methodSignatureForSelector:selector];
    if (!methodSignature) {
        NSString *errorTip = [NSString stringWithFormat:@"`%@`类的`%@`方法签名不存在", NSStringFromClass(self.class), NSStringFromSelector(selector)];
        NSAssert(methodSignature, errorTip);
        return nil;
    }
    NSInvocation *invocation = [NSInvocation
                                invocationWithMethodSignature:methodSignature];
    invocation.target = self;
    invocation.selector = selector;
    return invocation;
}

@end
