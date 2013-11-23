//
//  ViewController.m
//  MyCustomVCContainer
//
//  Created by Nimrod Gutman on 11/22/13.
//  Copyright (c) 2013 theguti.self. All rights reserved.
//

#import "ViewController.h"
#import "GGCustomContainerViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)openContainer {
    GGCustomContainerViewController *customContainer = [[GGCustomContainerViewController alloc] init];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:customContainer];
    [self presentViewController:navController animated:YES completion:nil];
}


@end
