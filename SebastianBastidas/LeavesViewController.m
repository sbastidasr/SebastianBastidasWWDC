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
    pathLayer.transform = CATransform3DMakeScale(0.2, 0.2, 0.2);
    NSMutableArray *leafArray = [[NSMutableArray alloc]init];
    
    for (int i = 0; i < 78; i++)
    {
        
        CAShapeLayer *pathLayerCopies = [NSKeyedUnarchiver unarchiveObjectWithData:[NSKeyedArchiver archivedDataWithRootObject:pathLayer]];
        [leafArray addObject:pathLayerCopies];
    }
    
    CAShapeLayer *leaf = leafArray[0];
    leaf.position= CGPointMake(33, 180);
    leaf = leafArray[1];
    leaf.position= CGPointMake(80, 168);
    leaf = leafArray[2];
    leaf.position= CGPointMake(56, 176);
    leaf = leafArray[3];
    leaf.position= CGPointMake(67, 148);
    leaf = leafArray[4];
    leaf.position= CGPointMake(47, 152);
    leaf = leafArray[5];
    leaf.position= CGPointMake(85, 142);
    leaf = leafArray[6];
    leaf.position= CGPointMake(90, 162);
    leaf = leafArray[7];
    leaf.position=  CGPointMake(120, 167);
    leaf = leafArray[8];
    leaf.position=CGPointMake(130, 122);
    leaf = leafArray[9];
    leaf.position= CGPointMake(105, 132);
    leaf = leafArray[10];
    leaf.position= CGPointMake(130, 102);
    leaf = leafArray[11];
    leaf.position= CGPointMake(137, 85);
    leaf = leafArray[12];
    leaf.position= CGPointMake(117, 89);
    leaf = leafArray[13];
    leaf.position= CGPointMake(100, 100);
    leaf = leafArray[14];
    leaf.position= CGPointMake(80, 115);
    leaf = leafArray[15];
    leaf.position= CGPointMake(193, 173);
    leaf = leafArray[16];
    leaf.position= CGPointMake(195, 190);
    leaf = leafArray[17];
    leaf.position= CGPointMake(177, 170);
    leaf = leafArray[18];
    leaf.position= CGPointMake(142, 150);
    leaf = leafArray[19];
    leaf.position= CGPointMake(172, 119);
    
    leaf = leafArray[20];
    leaf.position= CGPointMake(152, 164);
    leaf = leafArray[21];
    leaf.position= CGPointMake(172, 155);
    leaf = leafArray[22];
    leaf.position=CGPointMake(157, 132);
    leaf = leafArray[23];
    leaf.position= CGPointMake(142, 150);
    leaf = leafArray[24];
    leaf.position= CGPointMake(137, 187);
    leaf = leafArray[25];
    leaf.position=CGPointMake(157, 102);
    leaf = leafArray[26];
    leaf.position= CGPointMake(137, 218);
    leaf = leafArray[27];
    leaf.position= CGPointMake(153, 218);
    leaf = leafArray[28];
    leaf.position= CGPointMake(145, 244);
    leaf = leafArray[29];
    leaf.position= CGPointMake(157, 238);
    leaf = leafArray[30];
    leaf.position= CGPointMake(122, 238);
    leaf = leafArray[31];
    leaf.position= CGPointMake(102, 230);
    leaf = leafArray[32];
    leaf.position= CGPointMake(115, 212);
    leaf = leafArray[33];
    leaf.position= CGPointMake(95, 185);
    leaf = leafArray[34];
    leaf.position= CGPointMake(90, 215);
    leaf = leafArray[35];
    leaf.position= CGPointMake(65, 210);
    leaf = leafArray[36];
    leaf.position= CGPointMake(78, 193);
    leaf = leafArray[37];
    leaf.position= CGPointMake(38, 213);
    leaf = leafArray[38];
    leaf.position= CGPointMake(68, 228);
    leaf = leafArray[39];
    leaf.position= CGPointMake(65, 258);
    
    leaf = leafArray[40];
    leaf.position= CGPointMake(45, 260);
    leaf = leafArray[41];
    leaf.position= CGPointMake(35, 240);
    leaf = leafArray[42];
    leaf.position= CGPointMake(30, 263);
    leaf = leafArray[43];
    leaf.position= CGPointMake(50, 280);
    leaf = leafArray[44];
    leaf.position= CGPointMake(71, 275);
    leaf = leafArray[45];
    leaf.position= CGPointMake(110, 267);
    leaf = leafArray[46];
    leaf.position= CGPointMake(130, 267);
    leaf = leafArray[47];
    leaf.position= CGPointMake(78, 247);
    leaf = leafArray[48];
    leaf.position= CGPointMake(95, 247);
    leaf = leafArray[49];
    leaf.position= CGPointMake(190, 252);
    leaf = leafArray[50];
    leaf.position= CGPointMake(183, 270);
    leaf = leafArray[51];
    leaf.position= CGPointMake(195, 238);
    leaf = leafArray[52];
    leaf.position= CGPointMake(213, 207);
    leaf = leafArray[53];
    leaf.position= CGPointMake(213, 225);
    leaf = leafArray[54];
    leaf.position= CGPointMake(210, 250);
    leaf = leafArray[55];
    leaf.position= CGPointMake(228, 248);
    leaf = leafArray[56];
    leaf.position= CGPointMake(247, 242);
    leaf = leafArray[57];
    leaf.position= CGPointMake(244, 220);
    leaf = leafArray[58];
    leaf.position= CGPointMake(264, 230);
    leaf = leafArray[59];
    leaf.position= CGPointMake(280, 230);
    
    leaf = leafArray[60];
    leaf.position= CGPointMake(274, 180);
    leaf = leafArray[61];
    leaf.position= CGPointMake(254, 170);
    leaf = leafArray[62];
    leaf.position= CGPointMake (254, 200);
    leaf = leafArray[63];
    leaf.position= CGPointMake(234, 190);
    leaf = leafArray[64];
    leaf.position= CGPointMake(230, 156);
    leaf = leafArray[65];
    leaf.position= CGPointMake(230, 174);
    leaf = leafArray[66];
    leaf.position= CGPointMake(230, 128);
    leaf = leafArray[67];
    leaf.position= CGPointMake(250, 142);
    leaf = leafArray[68];
    leaf.position= CGPointMake(214, 128);
    leaf = leafArray[69];
    leaf.position= CGPointMake(214, 102);
   
    
    leaf = leafArray[70];
    leaf.position= CGPointMake(190, 96);
    leaf = leafArray[71];
    leaf.position= CGPointMake(200, 116);
    leaf = leafArray[72];
    leaf.position= CGPointMake(207, 156);
    leaf = leafArray[73];
    leaf.position= CGPointMake(186, 147);
    leaf = leafArray[74];
    leaf.position= CGPointMake(170, 188);

    leaf = leafArray[75];
    leaf.position= CGPointMake(154, 198);
    leaf = leafArray[76];
    leaf.position= CGPointMake(184, 218);

    leaf = leafArray[77];
    leaf.position= CGPointMake(174, 240);
    
    for (int i = 0; i < 78; i++)
    {
        [self.view.layer addSublayer:leafArray[i]];
    }
    /*
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"position.y";
    animation.fromValue = @200;
    animation.toValue = @350;
    animation.duration = 2;
    */
    for (int i = 0; i < 78; i++)
    {
        leaf = leafArray[i];
        CABasicAnimation *animation = [CABasicAnimation animation];
        animation.keyPath = @"position";
        animation.fromValue = [NSNumber numberWithDouble:(leaf.position.y)];
        animation.toValue = @380;
        
        //Random time value
        float lowerBound = 1.0;
        float upperBound = 4.0;
       float rndValue=lowerBound + ((float)arc4random() / UINT32_MAX) * (upperBound - lowerBound);
        
        animation.duration = rndValue;
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];

        
        [leaf addAnimation:animation forKey:@"shake"];
     
       leaf.position = CGPointMake(leaf.position.x , 380);
        
    }

    
    
 
}
@end




