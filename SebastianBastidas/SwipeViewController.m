//
//  SwipeViewController.m
//  SebastianBastidas
//
//  Created by Sebastian Bastidas on 4/19/15.
//  Copyright (c) 2015 sbastidasr. All rights reserved.
//

#import "SwipeViewController.h"
#import "DrawViewController.h"

@implementation SwipeViewController

-(void)viewDidLoad{
    //Add Swipe Gesture Right
    UISwipeGestureRecognizer *recognizerRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(SwipeRecognizer:)];
    recognizerRight.direction = UISwipeGestureRecognizerDirectionRight;
    //    recognizer.numberOfTouchesRequired = 1;
    recognizerRight.delegate = self;
    [self.view addGestureRecognizer:recognizerRight];
    
        //Add Swipe Gesture Left
    UISwipeGestureRecognizer *recognizerLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(SwipeRecognizer:)];
    recognizerLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    recognizerLeft.delegate = self;
    [self.view addGestureRecognizer:recognizerLeft];

    [self.navigationController setNavigationBarHidden:YES];
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    
    // Disallow recognition of tap gestures in the segmented control.
    if ((touch.view != self.view)) {//change it to your condition
        return NO;
    }
    return YES;
}

//Method to handle event on swipe
- (void) SwipeRecognizer:(UISwipeGestureRecognizer *)sender {
    if ( sender.direction == UISwipeGestureRecognizerDirectionRight ){
        
        [self.navigationController popViewControllerAnimated:YES];
        
    }else if ( sender.direction == UISwipeGestureRecognizerDirectionLeft ){
        
     [self performSegueWithIdentifier:@"next" sender:self];
        
    }
        //Add Swipe Gesture
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"embedSegue"]) {
        [self prepareForMapEmbeddingSegue:segue sender:sender];
    }
}

- (void)prepareForMapEmbeddingSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    DrawViewController *drawVC = (DrawViewController *)segue.destinationViewController;
    drawVC.title=self.title;
    
    // We can do any additional setup on mapViewController here,
    // like set its initial viewport.
}


@end
