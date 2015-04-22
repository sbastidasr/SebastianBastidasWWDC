//
//  LeavesViewController.m
//  SebastianBastidas
//
//  Created by Sebastian Bastidas on 4/21/15.
//  Copyright (c) 2015 sbastidasr. All rights reserved.
//



#define GESTURE_SCORE_THRESHOLD         5.0f

#import "DrawViewController.h"
#import "WTMGlyphDetectorView.h"
#import "PocketSVG.h"

#import "LeavesViewController.h"

@interface LeavesViewController ()


@end

@implementation LeavesViewController



- (void)viewDidLoad{
    [super viewDidLoad];
   
    [self drawLine];
}

-(NSDictionary *)imagePoints{
    NSDictionary* imagePoints = @{@"ruby":[NSValue valueWithCGPoint:CGPointMake(1, -209)],
                                  @"house":[NSValue valueWithCGPoint:CGPointMake(3, -209)]
                                  };
    return imagePoints;
}
-(NSDictionary *)imageColors{
    return @{@"ruby":[UIColor colorWithRed:237.0f/255.0f green:130.0f/255.0f blue:123.0f/255.0f alpha:1.0f],
             @"house":[UIColor colorWithRed:134.0f/255.0f green:189.0f/255.0f blue:199.0f/255.0f alpha:1.0f]
             };
}


- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];

}

-(void)drawLine
{
    //creation
    CGPathRef myPath = [PocketSVG pathFromSVGFileNamed:@"leaf4"];
    CAShapeLayer *pathLayer = [CAShapeLayer layer];
    pathLayer.path = myPath;
 
    pathLayer.strokeColor = [[self imageColors][@"ruby"] CGColor];
    pathLayer.lineWidth = 1;
    pathLayer.fillColor =  [[self imageColors][@"ruby"] CGColor];
   
    
    //Position
    pathLayer.position= CGPointMake(33, 180);
    pathLayer.transform = CATransform3DMakeScale(0.2, 0.2, 0.2);

    //displaying
    [self.view.layer addSublayer:pathLayer];
    
    NSMutableArray *leafArray = [[NSMutableArray alloc]init];
    
    for (int i = 0; i < 20; i++)
    {
        
        CAShapeLayer *pathLayerCopies = [NSKeyedUnarchiver unarchiveObjectWithData:[NSKeyedArchiver archivedDataWithRootObject:pathLayer]];
        [leafArray addObject:pathLayerCopies];
    }
    
    
    //Reference Ones! it takes 17 steps to a circle
    CAShapeLayer *leaf1 = leafArray[0];
    leaf1.position= CGPointMake(23, 170);
    leaf1.fillColor= [[UIColor blueColor] CGColor];
    
    
    //DefinitiveOnes
    CAShapeLayer *leaf2 = leafArray[1];
    leaf2.position= CGPointMake(80, 168);
    CAShapeLayer *leaf3 = leafArray[2];
    leaf3.position= CGPointMake(56, 176);
    CAShapeLayer *leaf4 = leafArray[3];
    leaf4.position= CGPointMake(67, 148);
    CAShapeLayer *leaf5 = leafArray[4];
    leaf5.position= CGPointMake(47, 152);
    // leaf4.fillColor= [[UIColor greenColor] CGColor];
    
    
    CAShapeLayer *leaf6 = leafArray[5];
    leaf6.position= CGPointMake(50, 200);
    CAShapeLayer *leaf7 = leafArray[6];
    leaf7.position= CGPointMake(50, 200);
    CAShapeLayer *leaf8 = leafArray[7];
    leaf8.position= CGPointMake(50, 200);
    CAShapeLayer *leaf9 = leafArray[8];
    leaf9.position= CGPointMake(50, 200);
    CAShapeLayer *leaf10 = leafArray[9];
    leaf10.position= CGPointMake(50, 200);
    CAShapeLayer *leaf11 = leafArray[10];
    leaf11.position= CGPointMake(50, 200);
    CAShapeLayer *leaf12 = leafArray[11];
    leaf12.position= CGPointMake(50, 200);
    CAShapeLayer *leaf13 = leafArray[12];
    leaf13.position= CGPointMake(50, 200);
    CAShapeLayer *leaf14 = leafArray[13];
    leaf14.position= CGPointMake(50, 200);
    CAShapeLayer *leaf15 = leafArray[14];
    leaf15.position= CGPointMake(50, 200);
    CAShapeLayer *leaf16 = leafArray[15];
    leaf16.position= CGPointMake(50, 200);
    CAShapeLayer *leaf17 = leafArray[16];
    leaf17.position= CGPointMake(50, 200);
    CAShapeLayer *leaf18 = leafArray[17];
    leaf18.position= CGPointMake(50, 200);
    CAShapeLayer *leaf19 = leafArray[18];
    leaf19.position= CGPointMake(50, 200);
    CAShapeLayer *leaf20 = leafArray[19];
    leaf20.position= CGPointMake(50, 200);

    
    for (int i = 0; i < 20; i++)
    {
        [self.view.layer addSublayer:leafArray[i]];
    }
    
    
    
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"position.y";
    animation.fromValue = @200;
    animation.toValue = @350;
    animation.duration = 2;
    
    [pathLayer addAnimation:animation forKey:@"basic"];
    
    pathLayer.position = CGPointMake(50, 350);
}
@end




