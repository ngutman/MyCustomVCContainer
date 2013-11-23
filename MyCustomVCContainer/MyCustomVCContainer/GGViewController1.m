//
//  GGViewController1.m
//  MyCustomVCContainer
//
//  Created by Nimrod Gutman on 11/22/13.
//  Copyright (c) 2013 theguti.self. All rights reserved.
//

#import "GGViewController1.h"

@interface GGViewController1 ()

@end

@implementation GGViewController1

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
}

- (void)dealloc
{
    NSLog(@"Deallocing GGViewController1");
}

@end
