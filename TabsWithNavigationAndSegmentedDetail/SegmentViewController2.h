//
//  SegmentViewController2.h
//  TabsWithNavigationAndSegmentedDetail
//
//  Created by Michael Luton on 2/8/12.
//  Copyright (c) 2012 Michael Luton. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SegmentViewController2 : UIViewController

@property (nonatomic, retain) UIViewController *managingViewController;

- (id)initWithParentViewController:(UIViewController *)aViewController;

@end
