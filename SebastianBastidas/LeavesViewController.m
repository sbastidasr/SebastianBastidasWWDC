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
    // CGPathRef myPath = [PocketSVG pathFromSVGFileNamed:[self title]];
    //1: Turn your SVG into a CGPath:
    CGPathRef myPath = [PocketSVG pathFromSVGFileNamed:@"leaf"];
    
    //2: To display it on screen, you can create a CAShapeLayer
    //and set myPath as its path property:
    CAShapeLayer *pathLayer = [CAShapeLayer layer];
    pathLayer.path = myPath;
    
    
    //pathLayer.frame = self.view.bounds;
    UIViewController *drawArea = self.childViewControllers.firstObject;
    pathLayer.frame = drawArea.view.bounds;
    
    
    //3: Fiddle with it using CAShapeLayer's properties:
    pathLayer.strokeColor = [[self imageColors][@"ruby"] CGColor];
    pathLayer.lineWidth = 10;
    pathLayer.fillColor = [[UIColor clearColor] CGColor];
    
    pathLayer.position= CGPointMake(50, 200);
    
    
    pathLayer.transform = CATransform3DMakeScale(0.2, 0.2, 0.2);
    
    //4: Display it!
    [self.view.layer addSublayer:pathLayer];
    
    
    /*
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"position.y";
    animation.fromValue = @200;
    animation.toValue = @350;
    animation.duration = 2;
    
    [pathLayer addAnimation:animation forKey:@"basic"];
    
    pathLayer.position = CGPointMake(50, 350);*/
}
@end




