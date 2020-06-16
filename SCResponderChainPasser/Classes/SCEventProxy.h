//
//  SCEventProxy.h
//  SCResponderChainPasser
//
//  Created by ty.Chen on 2020/6/16.
//

#import <Foundation/Foundation.h>
#import "SCEventProxyProtocol.h"

@interface SCEventProxy : NSObject <
SCEventProxyProtocol
>

@property (nonatomic, strong) NSDictionary<NSString *, NSInvocation *> *eventStrategy;

- (NSInvocation *)createInvocationForSelector:(SEL)selector;

@end
