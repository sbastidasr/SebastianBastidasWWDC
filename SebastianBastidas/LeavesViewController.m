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
@property(nonatomic,strong) NSMutableArray *leafArray;

@end

@implementation LeavesViewController

-(NSMutableArray *)leafArray{
    if(!_leafArray)
        _leafArray = [[NSMutableArray alloc]init];
    return _leafArray;
}


#pragma mark - Shake Functions

-(BOOL)canBecomeFirstResponder {
    return YES;
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:NO];
    [self becomeFirstResponder];
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:NO];
}

-(void)viewDidDisappear:(BOOL)animated {
    [self resignFirstResponder];
    [super viewDidDisappear:NO];
}

-(void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if (motion == UIEventSubtypeMotionShake )
    {
        for (int i = 0; i < 78; i++)
        {
            CAShapeLayer *leaf;
            leaf = self.leafArray[i];
            CABasicAnimation *animation = [CABasicAnimation animation];
            animation.keyPath = @"position.y";
            animation.fromValue = [NSNumber numberWithDouble:(leaf.position.y)];
            animation.toValue = @380;
            animation.delegate = self;
            
            //Random time value
            float lowerBound = 1.0;
            float upperBound = 4.0;
            float rndValue=lowerBound + ((float)arc4random() / UINT32_MAX) * (upperBound - lowerBound);
            
            animation.duration = rndValue;
            animation.timingFunction = [CAMediaTimingFunction functionWithName: kCAMediaTimingFunctionEaseOut];
            [animation setValue:leaf forKey:@"animationLayer"];
            [leaf addAnimation:animation forKey:@"basic"];
        }
    }
}
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    CALayer *layer = [anim valueForKey:@"animationLayer"];
    if (layer) {
        NSLog(@"removed %@ (%@) from superview", layer, [layer name]);
       //    layer.position = CGPointMake(layer.position.x , 380);
       [layer removeFromSuperlayer];

    }
}


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
    pathLayer.transform = CATransform3DMakeScale(0.2, 0.2, 0.2);
    
    for (int i = 0; i < 78; i++)
    {
        
        CAShapeLayer *pathLayerCopies = [NSKeyedUnarchiver unarchiveObjectWithData:[NSKeyedArchiver archivedDataWithRootObject:pathLayer]];
        [self.leafArray addObject:pathLayerCopies];
    }
    
    CAShapeLayer *leaf = self.leafArray[0];
    leaf.position= CGPointMake(33, 180);
    leaf = self.leafArray[1];
    leaf.position= CGPointMake(80, 168);
    leaf = self.leafArray[2];
    leaf.position= CGPointMake(56, 176);
    leaf = self.leafArray[3];
    leaf.position= CGPointMake(67, 148);
    leaf = self.leafArray[4];
    leaf.position= CGPointMake(47, 152);
    leaf = self.leafArray[5];
    leaf.position= CGPointMake(85, 142);
    leaf = self.leafArray[6];
    leaf.position= CGPointMake(90, 162);
    leaf = self.leafArray[7];
    leaf.position=  CGPointMake(120, 167);
    leaf = self.leafArray[8];
    leaf.position=CGPointMake(130, 122);
    leaf = self.leafArray[9];
    leaf.position= CGPointMake(105, 132);
    leaf = self.leafArray[10];
    leaf.position= CGPointMake(130, 102);
    leaf = self.leafArray[11];
    leaf.position= CGPointMake(137, 85);
    leaf = self.leafArray[12];
    leaf.position= CGPointMake(117, 89);
    leaf = self.leafArray[13];
    leaf.position= CGPointMake(100, 100);
    leaf = self.leafArray[14];
    leaf.position= CGPointMake(80, 115);
    leaf = self.leafArray[15];
    leaf.position= CGPointMake(193, 173);
    leaf = self.leafArray[16];
    leaf.position= CGPointMake(195, 190);
    leaf = self.leafArray[17];
    leaf.position= CGPointMake(177, 170);
    leaf = self.leafArray[18];
    leaf.position= CGPointMake(142, 150);
    leaf = self.leafArray[19];
    leaf.position= CGPointMake(172, 119);
    
    leaf = self.leafArray[20];
    leaf.position= CGPointMake(152, 164);
    leaf = self.leafArray[21];
    leaf.position= CGPointMake(172, 155);
    leaf = self.leafArray[22];
    leaf.position=CGPointMake(157, 132);
    leaf = self.leafArray[23];
    leaf.position= CGPointMake(142, 150);
    leaf = self.leafArray[24];
    leaf.position= CGPointMake(137, 187);
    leaf = self.leafArray[25];
    leaf.position=CGPointMake(157, 102);
    leaf = self.leafArray[26];
    leaf.position= CGPointMake(137, 218);
    leaf = self.leafArray[27];
    leaf.position= CGPointMake(153, 218);
    leaf = self.leafArray[28];
    leaf.position= CGPointMake(145, 244);
    leaf = self.leafArray[29];
    leaf.position= CGPointMake(157, 238);
    leaf = self.leafArray[30];
    leaf.position= CGPointMake(122, 238);
    leaf = self.leafArray[31];
    leaf.position= CGPointMake(102, 230);
    leaf = self.leafArray[32];
    leaf.position= CGPointMake(115, 212);
    leaf = self.leafArray[33];
    leaf.position= CGPointMake(95, 185);
    leaf = self.leafArray[34];
    leaf.position= CGPointMake(90, 215);
    leaf = self.leafArray[35];
    leaf.position= CGPointMake(65, 210);
    leaf = self.leafArray[36];
    leaf.position= CGPointMake(78, 193);
    leaf = self.leafArray[37];
    leaf.position= CGPointMake(38, 213);
    leaf = self.leafArray[38];
    leaf.position= CGPointMake(68, 228);
    leaf = self.leafArray[39];
    leaf.position= CGPointMake(65, 258);
    
    leaf = self.leafArray[40];
    leaf.position= CGPointMake(45, 260);
    leaf = self.leafArray[41];
    leaf.position= CGPointMake(35, 240);
    leaf = self.leafArray[42];
    leaf.position= CGPointMake(30, 263);
    leaf = self.leafArray[43];
    leaf.position= CGPointMake(50, 280);
    leaf = self.leafArray[44];
    leaf.position= CGPointMake(71, 275);
    leaf = self.leafArray[45];
    leaf.position= CGPointMake(110, 267);
    leaf = self.leafArray[46];
    leaf.position= CGPointMake(130, 267);
    leaf = self.leafArray[47];
    leaf.position= CGPointMake(78, 247);
    leaf = self.leafArray[48];
    leaf.position= CGPointMake(95, 247);
    leaf = self.leafArray[49];
    leaf.position= CGPointMake(190, 252);
    leaf = self.leafArray[50];
    leaf.position= CGPointMake(183, 270);
    leaf = self.leafArray[51];
    leaf.position= CGPointMake(195, 238);
    leaf = self.leafArray[52];
    leaf.position= CGPointMake(213, 207);
    leaf = self.leafArray[53];
    leaf.position= CGPointMake(213, 225);
    leaf = self.leafArray[54];
    leaf.position= CGPointMake(210, 250);
    leaf = self.leafArray[55];
    leaf.position= CGPointMake(228, 248);
    leaf = self.leafArray[56];
    leaf.position= CGPointMake(247, 242);
    leaf = self.leafArray[57];
    leaf.position= CGPointMake(244, 220);
    leaf = self.leafArray[58];
    leaf.position= CGPointMake(264, 230);
    leaf = self.leafArray[59];
    leaf.position= CGPointMake(280, 230);
    
    leaf = self.leafArray[60];
    leaf.position= CGPointMake(274, 180);
    leaf = self.leafArray[61];
    leaf.position= CGPointMake(254, 170);
    leaf = self.leafArray[62];
    leaf.position= CGPointMake (254, 200);
    leaf = self.leafArray[63];
    leaf.position= CGPointMake(234, 190);
    leaf = self.leafArray[64];
    leaf.position= CGPointMake(230, 156);
    leaf = self.leafArray[65];
    leaf.position= CGPointMake(230, 174);
    leaf = self.leafArray[66];
    leaf.position= CGPointMake(230, 128);
    leaf = self.leafArray[67];
    leaf.position= CGPointMake(250, 142);
    leaf = self.leafArray[68];
    leaf.position= CGPointMake(214, 128);
    leaf = self.leafArray[69];
    leaf.position= CGPointMake(214, 102);
   
    
    leaf = self.leafArray[70];
    leaf.position= CGPointMake(190, 96);
    leaf = self.leafArray[71];
    leaf.position= CGPointMake(200, 116);
    leaf = self.leafArray[72];
    leaf.position= CGPointMake(207, 156);
    leaf = self.leafArray[73];
    leaf.position= CGPointMake(186, 147);
    leaf = self.leafArray[74];
    leaf.position= CGPointMake(170, 188);

    leaf = self.leafArray[75];
    leaf.position= CGPointMake(154, 198);
    leaf = self.leafArray[76];
    leaf.position= CGPointMake(184, 218);

    leaf = self.leafArray[77];
    leaf.position= CGPointMake(174, 240);
    
    for (int i = 0; i < 78; i++)
    {
        [self.view.layer addSublayer:self.leafArray[i]];
    }
    /*
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"position.y";
    animation.fromValue = @200;
    animation.toValue = @350;
    animation.duration = 2;
    */
    
    
    
 
}
@end




