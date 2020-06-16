//
//  SCPurpleView.m
//  SCResponderChainPasser_Example
//
//  Created by ty.Chen on 2020/6/16.
//  Copyright © 2020 Samueler. All rights reserved.
//

#import "SCPurpleView.h"
#import "SCOrangeView.h"

@implementation SCPurpleView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        SCOrangeView *orangeView = [[SCOrangeView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
        orangeView.backgroundColor = [UIColor orangeColor];
        [self addSubview:orangeView];
    }
    return self;
}

@end
