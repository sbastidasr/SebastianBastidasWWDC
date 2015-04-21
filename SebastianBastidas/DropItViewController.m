//
//  ViewController.m
//  Dropit
//
//  Created by Sebastian Bastidas on 3/16/15.
//  Copyright (c) 2015 sbastidasr. All rights reserved.
//

#import "DropItViewController.h"
#import "DropItBehavior.h"
@interface DropItViewController ()
@property (strong, nonatomic) IBOutlet UIView *gameView;
@property (strong, nonatomic) UIDynamicAnimator *animator;
@property (strong, nonatomic)DropItBehavior* dropItBehavior;
@end

@implementation DropItViewController
static const CGSize DROP_SIZE = { 20, 20 };



-(UIDynamicAnimator *) animator{
    if(!_animator){
        _animator=[[UIDynamicAnimator alloc]initWithReferenceView:self.gameView];
        _animator.delegate=self;  //this makes self in charge of the "entered/exiited quiescent state method"
    }
    return _animator;
}

-(DropItBehavior *)dropItBehavior{
    _dropItBehavior=[[DropItBehavior alloc]init];
    [self.animator addBehavior:_dropItBehavior];
    return _dropItBehavior;
}



- (IBAction)tap:(UITapGestureRecognizer *)sender {
    [self drop];
}

-(void)drop{
  
    CGRect frame;
    frame.origin = CGPointZero;
    frame.size = DROP_SIZE;
    int x = 200;
    //(arc4random()%(int)self.gameView.bounds.size.width) / DROP_SIZE.width;//random place in x axis,but in a grid. Does a floor because it is an int
    frame.origin.x = 50;
    
    UIView *dropView = [[UIView alloc]initWithFrame:frame];
    dropView.backgroundColor=[self randomColor];
    [self.gameView addSubview:dropView];
    [self.dropItBehavior addItem:dropView];
   
    /*
    CAShapeLayer *shapeView = [[CAShapeLayer alloc] init];
    
    [shapeView setPath:[self createPath].CGPath];
    
    [[self.view layer] addSublayer:shapeView];
    
    */
    
    
}

-(UIColor *)randomColor {
    switch (arc4random()%5) {//number between 1 and 5
        case 0: return [UIColor greenColor];
        case 1: return [UIColor blueColor];
        case 2: return [UIColor orangeColor];
        case 3: return [UIColor redColor];
        case 4: return [UIColor purpleColor];
        }
    return [UIColor blackColor];
}


@end
