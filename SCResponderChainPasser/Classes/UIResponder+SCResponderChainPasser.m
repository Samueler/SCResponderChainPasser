//
//  UIResponder+SCResponderChainPasser.m
//  SCResponderChainPasser
//
//  Created by ty.Chen on 2020/6/16.
//  Copyright © 2020 Samueler. All rights reserved.
//

#import "UIResponder+SCResponderChainPasser.h"
#import <objc/runtime.h>

const void *kEventProxyKey = "kEventProxyKey";

id SCNotNilObject(id object) {
    if (!object) {
        return [NSNull null];
    }
    return object;
}

@implementation UIResponder (SCResponderChainPasser)

#pragma mark - Public Functions

- (void)routeEventForName:(NSString *)eventName {
    if (self.eventProxy) {
        [self.eventProxy handleEventProxyForEvent:eventName];
    } else {
        [self.nextResponder routeEventForName:eventName];
    }
}

- (void)routeEventForName:(NSString *)eventName paramater:(id)paramater {
    if (self.eventProxy) {
        if (paramater) {
            [self.eventProxy handleEventProxyForEvent:eventName paramaters:@[paramater]];
        } else {
            [self.eventProxy handleEventProxyForEvent:eventName paramaters:nil];
        }
    } else {
        [[self nextResponder] routeEventForName:eventName paramater:paramater];
    }
}

- (void)routeEventForName:(NSString *)eventName paramaters:(NSArray *)paramaters {
    if (self.eventProxy) {
        [self.eventProxy handleEventProxyForEvent:eventName paramaters:paramaters];
    } else {
        [[self nextResponder] routeEventForName:eventName paramaters:paramaters];
    }
}

#pragma mark - Setter

- (void)setEventProxy:(id<SCEventProxyProtocol>)eventProxy {
    objc_setAssociatedObject(self, kEventProxyKey, eventProxy, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark - Getter

- (id<SCEventProxyProtocol>)eventProxy {
    return objc_getAssociatedObject(self, kEventProxyKey);
}

@end
