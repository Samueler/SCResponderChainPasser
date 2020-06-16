//
//  UIResponder+SCResponderChainPasser.h
//  SCResponderChainPasser
//
//  Created by ty.Chen on 2020/6/16.
//  Copyright © 2020 Samueler. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCEventProxyProtocol.h"

id SCNotNilObject(id object);

@interface UIResponder (SCResponderChainPasser)

@property (nonatomic, strong) id<SCEventProxyProtocol> eventProxy;

- (void)routeEventForName:(NSString *)eventName;

- (void)routeEventForName:(NSString *)eventName paramater:(id)paramater;

- (void)routeEventForName:(NSString *)eventName paramaters:(NSArray *)paramaters;

@end
