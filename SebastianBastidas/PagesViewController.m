//
//  IntroPages.m
//  
//
//  Created by Sebastian Bastidas on 4/22/15.
//
//

#import "PagesViewController.h"

@implementation PagesViewController
{
    NSArray *myViewControllers;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    
     [self.navigationController setNavigationBarHidden:NO];
    
    /*
    self.delegate = self;
    self.dataSource = self;
    
    UIViewController *p1 = [self.storyboard
                            instantiateViewControllerWithIdentifier:@"1"];
    UIViewController *p2 = [self.storyboard
                            instantiateViewControllerWithIdentifier:@"2"];
    UIViewController *p3 = [self.storyboard
                            instantiateViewControllerWithIdentifier:@"3"];
    UIViewController *p4 = [self.storyboard
                            instantiateViewControllerWithIdentifier:@"4"];
    UIViewController *p5 = [self.storyboard
                            instantiateViewControllerWithIdentifier:@"5"];
    
    myViewControllers = @[p1,p2,p3,p4,p5];
    
    [self setViewControllers:@[p1]
                   direction:UIPageViewControllerNavigationDirectionForward
                    animated:NO completion:nil];
    
    NSLog(@"loaded!");*/
}

-(UIViewController *)viewControllerAtIndex:(NSUInteger)index
{
    return myViewControllers[index];
}

-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController
     viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger currentIndex = [myViewControllers indexOfObject:viewController];
    // get the index of the current view controller on display
    
    if (currentIndex > 0)
    {
        return [myViewControllers objectAtIndex:currentIndex-1];
        // return the previous viewcontroller
    } else
    {
        return nil;
        // do nothing
    }
}
-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController
      viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger currentIndex = [myViewControllers indexOfObject:viewController];
    // get the index of the current view controller on display
    // check if we are at the end and decide if we need to present
    // the next viewcontroller
    if (currentIndex < [myViewControllers count]-1)
    {
        return [myViewControllers objectAtIndex:currentIndex+1];
        // return the next view controller
    } else
    {
        return nil;
        // do nothing
    }
}
-(NSInteger)presentationCountForPageViewController:
(UIPageViewController *)pageViewController
{
    return myViewControllers.count;
}

-(NSInteger)presentationIndexForPageViewController:
(UIPageViewController *)pageViewController
{
    return 0;
}

@end