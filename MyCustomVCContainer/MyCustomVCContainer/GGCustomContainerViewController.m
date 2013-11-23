//
//  GGCustomContainerViewController.m
//  MyCustomVCContainer
//
//  Created by Nimrod Gutman on 11/22/13.
//  Copyright (c) 2013 theguti.self. All rights reserved.
//

#import "GGCustomContainerViewController.h"
#import "GGViewController1.h"
#import "GGViewController2.h"

@interface GGCustomContainerViewController ()
@property (nonatomic, strong) UISegmentedControl *segmentControl;
@property (nonatomic, strong) UIViewController *currentVC;
@end

@implementation GGCustomContainerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self loadTab];
    [self loadViewController:[[GGViewController1 alloc] init] fromLeft:NO];
}

- (void)loadTab
{
    self.segmentControl = [[UISegmentedControl alloc] initWithItems:@[@"View Controller 1",
                                                                      @"View Controller 2"]];
    self.segmentControl.selectedSegmentIndex = 0;
    [self.segmentControl addTarget:self
                            action:@selector(tabTapped)
                  forControlEvents:UIControlEventValueChanged];
    self.navigationItem.titleView = self.segmentControl;
}

- (void)tabTapped
{
    if ([self.currentVC isKindOfClass:[GGViewController1 class]]) {
        [self loadViewController:[[GGViewController2 alloc] init] fromLeft:YES];
    } else {
        [self loadViewController:[[GGViewController1 alloc] init] fromLeft:NO];
    }
}

- (void)loadViewController:(UIViewController *)vc
                  fromLeft:(BOOL)fromLeft
{
    [self addChildViewController:vc];
    if (!self.currentVC) {
        [self.view addSubview:vc.view];
        vc.view.frame = self.view.bounds;
        self.currentVC = vc;
        return;
    }
    
    NSInteger direction = fromLeft ? 1 : -1;
    
    vc.view.frame = CGRectMake(vc.view.frame.size.width * direction,
                               0,
                               vc.view.frame.size.width,
                               vc.view.frame.size.height);
    
    [self transitionFromViewController:self.currentVC
                      toViewController:vc
                              duration:0.3
                               options:0
                            animations:^{
                                vc.view.frame = CGRectMake(0, 0, vc.view.frame.size.width, vc.view.frame.size.height);
                                self.currentVC.view.frame = CGRectMake(self.currentVC.view.frame.size.width * direction * -1,
                                                                       0,
                                                                       self.currentVC.view.frame.size.width,
                                                                       self.currentVC.view.frame.size.height);
    } completion:^(BOOL finished) {
        [self.currentVC removeFromParentViewController];
        self.currentVC = vc;
    }];
}

@end
