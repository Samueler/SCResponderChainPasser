//
//  SCEventProxyProtocol.h
//  SCResponderChainPasser
//
//  Created by ty.Chen on 2020/6/16.
//

#import <Foundation/Foundation.h>

@protocol SCEventProxyProtocol <NSObject>

@optional

/// 处理事件的代理方法（不带参数  默认拆包：将NSValue转化为对应的基本数据类型和结构体）
/// @param eventName 处理的事件名称
- (void)handleEventProxyForEvent:(NSString *)eventName;

/// 处理事件的代理方法（默认拆包：将NSValue转化为对应的基本数据类型和结构体）
/// @param eventName 处理的事件名称
/// @param paramaters 参数数组
- (void)handleEventProxyForEvent:(NSString *)eventName
                      paramaters:(NSArray *)paramaters;

/// 处理事件的代理方法
/// @param eventName 处理的事件名称
/// @param paramaters 参数数组
/// @param needWrap 是否需要拆包
- (void)handleEventProxyForEvent:(NSString *)eventName
                      paramaters:(NSArray *)paramaters
                        needWrap:(BOOL)needWrap;

@end
