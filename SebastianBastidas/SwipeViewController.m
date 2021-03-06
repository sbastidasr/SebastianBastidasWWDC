//
//  SwipeViewController.m
//  SebastianBastidas
//
//  Created by Sebastian Bastidas on 4/19/15.
//  Copyright (c) 2015 sbastidasr. All rights reserved.
//

#import "SwipeViewController.h"
#import "DrawViewController.h"
#import "WebViewController.h"

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
    
    
}
-(void)viewDidAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    if(self.dismissImageView){
        self.dismissImageView.alpha=0.0f;
    }
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
        
    }else if ( sender.direction == UISwipeGestureRecognizerDirectionLeft ){
        
     [self performSegueWithIdentifier:@"next" sender:self];
        
    }
        //Add Swipe Gesture
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"embedSegue"]) {
        [self prepareForMapEmbeddingSegue:segue sender:sender];
    }
    
    if ([segue.identifier isEqual:@"Ukuku"])
    {
        WebViewController *webView =  [segue destinationViewController];
        webView.strURL=@"http://sbastidasr.com/post/116583534124/ukuku";
    }
    if ([segue.identifier isEqual:@"github"])
    {
        WebViewController *webView =  [segue destinationViewController];
        webView.strURL=@"http://github.com/sbastidasr";
    }
    if ([segue.identifier isEqual:@"twitter"])
    {
        WebViewController *webView =  [segue destinationViewController];
        webView.strURL=@"http://twitter.com/sbastidasr";
    }
    if ([segue.identifier isEqual:@"blog"])
    {
        WebViewController *webView =  [segue destinationViewController];
        webView.strURL=@"http://sbastidasr.com";
    }
    

}





- (void)prepareForMapEmbeddingSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    DrawViewController *drawVC = (DrawViewController *)segue.destinationViewController;
    drawVC.title=self.title;
    
    // We can do any additional setup on mapViewController here,
    // like set its initial viewport.
}


@end
