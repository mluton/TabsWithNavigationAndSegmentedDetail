//
//  DetailViewController.h
//  TabsWithNavigationAndSegmentedDetail
//
//  Created by Michael Luton on 2/8/12.
//  Copyright (c) 2012 Michael Luton. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (nonatomic, retain) IBOutlet UISegmentedControl *segmentedControl;
@property (nonatomic, retain) UIViewController *activeViewController;
@property (nonatomic, retain) NSArray *segmentedViewControllers;

@end
