//
//  SegmentViewController2.m
//  TabsWithNavigationAndSegmentedDetail
//
//  Created by Michael Luton on 2/8/12.
//  Copyright (c) 2012 Michael Luton. All rights reserved.
//

#import "SegmentViewController2.h"

@implementation SegmentViewController2

@synthesize managingViewController;


- (id)initWithParentViewController:(UIViewController *)aViewController
{
    if (self = [super initWithNibName:@"SegmentViewController2" bundle:nil]) {
        self.managingViewController = aViewController;
        self.title = @"Two";
    }

    return self;
}


- (void)dealloc
{
    self.managingViewController = nil;
    [super dealloc];
}


@end
