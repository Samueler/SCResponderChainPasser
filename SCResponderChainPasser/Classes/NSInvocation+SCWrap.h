//
//  NSInvocation+SCWrap.h
//  SCResponderChainPasser
//
//  Created by ty.Chen on 2020/6/16.
//

#import <Foundation/Foundation.h>

@interface NSInvocation (SCWrap)

- (void)sc_wrapAndSetArguments:(NSArray *)arguments
                      needWrap:(BOOL)needWrap;

@end
