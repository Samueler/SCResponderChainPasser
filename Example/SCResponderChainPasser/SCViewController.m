//
//  SCViewController.m
//  SCResponderChainPasser
//
//  Created by Samueler on 06/16/2020.
//  Copyright (c) 2020 Samueler. All rights reserved.
//

#import "SCViewController.h"
#import <UIResponder+SCResponderChainPasser.h>
#import "SCTestEventProxy.h"
#import "SCPurpleView.h"

@interface SCViewController ()

@end

@implementation SCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    SCPurpleView *purpleView = [[SCPurpleView alloc] initWithFrame:CGRectMake(100, 100, 300, 300)];
    purpleView.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:purpleView];
    
    self.eventProxy = [[SCTestEventProxy alloc] init];
}

@end
