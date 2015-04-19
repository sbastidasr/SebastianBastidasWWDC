//
//  SwipeViewController.m
//  SebastianBastidas
//
//  Created by Sebastian Bastidas on 4/19/15.
//  Copyright (c) 2015 sbastidasr. All rights reserved.
//

#import "SwipeViewController.h"

@implementation SwipeViewController

-(void)viewDidLoad{
    //Add Swipe Gesture Right
    UISwipeGestureRecognizer *recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(SwipeRecognizer:)];
    recognizer.direction = UISwipeGestureRecognizerDirectionRight;
    recognizer.numberOfTouchesRequired = 1;
    recognizer.delegate = self;
    [self.view addGestureRecognizer:recognizer];

    
    [self.navigationController setNavigationBarHidden:YES];
}


//Delegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    if ([touch.view isKindOfClass:[UIView class]])
    {
        return YES;
    }
    return NO;
}

//Method to handle event on swipe
- (void) SwipeRecognizer:(UISwipeGestureRecognizer *)sender {
    if ( sender.direction == UISwipeGestureRecognizerDirectionRight ){
        
        [self.navigationController popViewControllerAnimated:YES];
        
    }
}


@end
