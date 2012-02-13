//
//  AppDelegate.m
//  TabsWithNavigationAndSegmentedDetail
//
//  Created by Michael Luton on 2/8/12.
//  Copyright (c) 2012 Michael Luton. All rights reserved.
//

#import "AppDelegate.h"
#import "FirstViewController.h"
#import "TableViewController.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize tabBarController = _tabBarController;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];

    UIViewController *viewController1 = [[[FirstViewController alloc] initWithNibName:@"FirstViewController" bundle:nil] autorelease];
    UIViewController *viewController2 = [[[TableViewController alloc] initWithNibName:@"TableViewController" bundle:nil] autorelease];
    UINavigationController *navigationController1 = [[[UINavigationController alloc] initWithRootViewController:viewController1] autorelease];
    UINavigationController *navigationController2 = [[[UINavigationController alloc] initWithRootViewController:viewController2] autorelease];

    self.tabBarController = [[[UITabBarController alloc] init] autorelease];
    self.tabBarController.viewControllers = [NSArray arrayWithObjects:navigationController1, navigationController2, nil];

    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)dealloc
{
    [_window release];
    [_tabBarController release];
    [super dealloc];
}


@end
