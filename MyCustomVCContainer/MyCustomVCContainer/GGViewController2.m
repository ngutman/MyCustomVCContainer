//
//  GGViewController2.m
//  MyCustomVCContainer
//
//  Created by Nimrod Gutman on 11/22/13.
//  Copyright (c) 2013 theguti.self. All rights reserved.
//

#import "GGViewController2.h"

@interface GGViewController2 ()

@end

@implementation GGViewController2

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor greenColor];
}

- (void)dealloc
{
    NSLog(@"Deallocing GGViewController2");
}

@end
