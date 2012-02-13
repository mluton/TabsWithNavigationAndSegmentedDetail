//
//  SegmentViewController1.m
//  TabsWithNavigationAndSegmentedDetail
//
//  Created by Michael Luton on 2/8/12.
//  Copyright (c) 2012 Michael Luton. All rights reserved.
//

#import "SegmentViewController1.h"

@implementation SegmentViewController1

@synthesize managingViewController;


- (id)initWithParentViewController:(UIViewController *)aViewController
{
    if (self = [super initWithNibName:@"SegmentViewController1" bundle:nil]) {
        self.managingViewController = aViewController;
        self.title = @"One";
    }

    return self;
}


- (void)dealloc
{
    self.managingViewController = nil;
    [super dealloc];
}


@end
