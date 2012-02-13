## Using a UISegmentedControl to Change Views

Demonstration of an iOS tabbed view application where individual tabs can contain a navigation controller and table view. Furthermore, the detail view of the table has a segmented control in the navigation bar used to switch between different detail views. This is similar to (but not exactly the same as) Apple's "store" apps like iTunes, App Store and Apple Store.

This should provide a decent starting point for anyone wanting to create a store or catalogue style app who want to stick to standard iOS UI elements and conventions.

There is no .xib file for the main view. The UITabBarController is setup programmatically in `AppDelegate.m`. In order to place a UINavigationController as the contents of a tab instead of a vanilla UIViewController you must create a UINavigationController with the desired UIViewController as its root view controller.

#### AppDelegate.m

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

The segmented control in the detail view uses large portions of the great example by Marcus Crafter at 
[http://redartisan.com/2010/5/26/uisegmented-control-view-switching](http://redartisan.com/2010/5/26/uisegmented-control-view-switching). I opted to use his older example which requires a container view. Marcus has a more recent example which doesn't require a container view and is generally cleaner. However, I couldn't quite figure out how to get that to work in this particular context.

Comments, Feedback, Suggestions: [Michael Luton](mailto:mluton@gmail.com)

MIT license.
