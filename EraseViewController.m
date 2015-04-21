//
//  EraseViewController.m
//  SebastianBastidas
//
//  Created by Sebastian Bastidas on 4/20/15.
//  Copyright (c) 2015 sbastidasr. All rights reserved.
//
#import <QuartzCore/QuartzCore.h>
#import "EraseViewController.h"
#import "EraseImageView.h"
#import "SwipeViewController.h"

@interface EraseViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *label3;

@property (weak, nonatomic) IBOutlet UIImageView *label1;
@property (weak, nonatomic) IBOutlet UIImageView *label2;
@property (weak, nonatomic) IBOutlet UIImageView *label4;


@end

@implementation EraseViewController

  
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
   //self.label3.alpha = 0.0f;
   self.label1.alpha = 1.0f;
    self.label4.alpha = 0.0f;
    self.label2.alpha = 0.0f;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
   CGRect newFrame=self.view.frame;
  
 //   newFrame.origin.y -= (newFrame.size.height*0.08);
    
    EraseImageView* imageView = [[EraseImageView alloc]initWithFrame:newFrame];
    imageView.foregroundImage =  [UIImage imageNamed:@"color.png"];
      imageView.backgroundImage =  [UIImage imageNamed:@"colored.png"];
    imageView.alpha=0.5f;
    [self.view addSubview:imageView];
    
    
    /*UIView *swipeView = [[swipeView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-60, self.view.frame.size.width, 60.0f)];
    swipeView.backgroundColor = [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.5f];
    
    swipeView.layer.borderColor = [UIColor blackColor].CGColor;
    swipeView.layer.borderWidth = 3.0f;

   
    [self.view addSubview:swipeView];
     */
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
