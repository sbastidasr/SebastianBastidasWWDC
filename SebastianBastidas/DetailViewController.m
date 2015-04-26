//
//  DetailViewController.m
//  SebastianBastidas
//
//  Created by Sebastian Bastidas on 4/23/15.
//  Copyright (c) 2015 sbastidasr. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

-(void)viewDidAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:NO];
}

-(void)viewDidLoad{
    //Add Swipe Gesture Right
    UISwipeGestureRecognizer *recognizerRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(SwipeRecognizer:)];
    recognizerRight.direction = UISwipeGestureRecognizerDirectionRight;
    //    recognizer.numberOfTouchesRequired = 1;
    recognizerRight.delegate = self;
    [self.view addGestureRecognizer:recognizerRight];
    
     self.title = @"Information";
    [self.navigationController.navigationBar setAlpha:0.0f];
}


- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    
    // Disallow recognition of tap gestures in the segmented control.
    if ((touch.view != self.view)) {//change it to your condition
        return NO;
    }
    return YES;
}
- (IBAction)dismissInfoButton:(UIButton *)sender {
    sender.enabled=NO;
    sender.hidden=YES;
}

//Method to handle event on swipe
- (void) SwipeRecognizer:(UISwipeGestureRecognizer *)sender {
    if ( sender.direction == UISwipeGestureRecognizerDirectionRight ){
        [self.navigationController popViewControllerAnimated:YES];
    }
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
