//
//  DetailViewController.m
//  TabsWithNavigationAndSegmentedDetail
//
//  Created by Michael Luton on 2/8/12.
//  Copyright (c) 2012 Michael Luton. All rights reserved.
//  Segmented control code copyright 2010 Red Artisan. All rights reserved.
//

#import "DetailViewController.h"
#import "SegmentViewController1.h"
#import "SegmentViewController2.h"
#import "NSArray+PerformSelector.h"

@interface DetailViewController ()
- (void)didChangeSegmentControl:(UISegmentedControl *)control;
- (NSArray *)segmentedViewControllerContent;
@end

@implementation DetailViewController

@synthesize segmentedControl;
@synthesize activeViewController;
@synthesize segmentedViewControllers;


- (void)viewDidLoad
{
    [super viewDidLoad];

    self.segmentedViewControllers = [self segmentedViewControllerContent];
    NSArray *segmentTitles = [self.segmentedViewControllers arrayByPerformingSelector:@selector(title)];

    self.segmentedControl = [[[UISegmentedControl alloc] initWithItems:segmentTitles] autorelease];
    self.segmentedControl.selectedSegmentIndex = 0;
    self.segmentedControl.segmentedControlStyle = UISegmentedControlStyleBar;
    [self.segmentedControl addTarget:self action:@selector(didChangeSegmentControl:) forControlEvents:UIControlEventValueChanged];    
    
    self.navigationItem.titleView = self.segmentedControl;
    [self didChangeSegmentControl:self.segmentedControl];
}


- (NSArray *)segmentedViewControllerContent
{
    UIViewController *controller1 = [[SegmentViewController1 alloc] initWithParentViewController:self];
    UIViewController *controller2 = [[SegmentViewController2 alloc] initWithParentViewController:self];
    
    NSArray *controllers = [NSArray arrayWithObjects:controller1, controller2, nil];
    
    [controller1 release];
    [controller2 release];
    
    return controllers;
}


- (void)didChangeSegmentControl:(UISegmentedControl *)control
{
    if (self.activeViewController) {
        [self.activeViewController viewWillDisappear:NO];
        [self.activeViewController.view removeFromSuperview];
        [self.activeViewController viewDidDisappear:NO];
    }
    
    self.activeViewController = [self.segmentedViewControllers objectAtIndex:control.selectedSegmentIndex];
    
    [self.activeViewController viewWillAppear:NO];
    [self.view addSubview:self.activeViewController.view];
    [self.activeViewController viewDidAppear:NO];
}


#pragma mark UINavigationControllerDelegate control

// Required to ensure we call viewDidAppear/viewWillAppear on ourselves (and the active view controller)
// inside of a navigation stack, since viewDidAppear/willAppear insn't invoked automatically. Without this
// selected table views don't know when to de-highlight the selected row.


- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [viewController viewDidAppear:animated];
}


- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [viewController viewWillAppear:animated];
}


#pragma mark Memory management


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    for (UIViewController * viewController in self.segmentedViewControllers) {
        [viewController didReceiveMemoryWarning];
    }
}


- (void)viewDidUnload
{
    self.segmentedControl = nil;
    self.segmentedViewControllers = nil;
    self.activeViewController = nil;
    
    [super viewDidUnload];
}


@end
