
//
//  AppDelegate.m
//  SebastianBastidas
//
//  Created by Sebastian Bastidas on 4/17/15.
//  Copyright (c) 2015 sbastidasr. All rights reserved.
//

#define GESTURE_SCORE_THRESHOLD         5.0f

#import "DrawViewController.h"
#import "WTMGlyphDetectorView.h"
#import "PocketSVG.h"
@interface DrawViewController ()

@property (nonatomic, strong) WTMGlyphDetectorView *gestureDetectorView;
@property (nonatomic, strong) IBOutlet UILabel *lblStatus;

@end

@implementation DrawViewController
@synthesize gestureDetectorView;
@synthesize lblStatus;

const CGPoint ruby = {-1.0f, -209.0f};


- (void)viewDidLoad{
    [super viewDidLoad];
    self.gestureDetectorView = [[WTMGlyphDetectorView alloc] initWithFrame:self.view.bounds];
    self.gestureDetectorView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.gestureDetectorView.delegate = self;
    [self.gestureDetectorView loadTemplatesWithNames:@"ruby", @"circle", @"square", @"triangle",@"4", nil];
    [self.view addSubview:self.gestureDetectorView];
    [self drawLine];
}

-(NSDictionary *)imagePoints{
       NSDictionary* imagePoints = @{@"ruby":[NSValue valueWithCGPoint:CGPointMake(1, -209)],
                                     @"house":[NSValue valueWithCGPoint:CGPointMake(3, -209)]
                                     };
    return imagePoints;
}
-(NSDictionary *)imageColors{
    return @{@"ruby":[UIColor redColor],
                                  @"house":[UIColor colorWithRed:134.0f/255.0f green:189.0f/255.0f blue:199.0f/255.0f alpha:1.0f]
                                  };
}


- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
   // NSString *glyphNames = [self.gestureDetectorView getGlyphNamesString];
    //This logs the loaded glyphs
    //if ([glyphNames length] > 0) {
    //   NSLog(@"Loaded with %@ templates.\n\nStart drawing.", [self.gestureDetectorView getGlyphNamesString]);
    //}
}

- (void)viewDidUnload
{
    [self.gestureDetectorView removeFromSuperview];
    self.gestureDetectorView.delegate = nil;
    self.gestureDetectorView = nil;
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation{
  return YES;
}


#pragma mark - Delegate

- (void)wtmGlyphDetectorView:(WTMGlyphDetectorView*)theView glyphDetected:(WTMGlyph *)glyph withScore:(float)score{
    if (score < GESTURE_SCORE_THRESHOLD)
    return;
  
  //  NSString *glyphNames = [self.gestureDetectorView getGlyphNamesString];
    //if ([glyphNames length] > 0)
        //NSLog(@"Loaded with %@ templates.\n\n", glyphNames);
    NSLog(@"Last gesture detected: %@\nScore: %.3f", glyph.name, score);
    
    if ([glyph.name isEqualToString:@"ruby"] || [glyph.name isEqualToString:@"circle"]){
        [self performSegueWithIdentifier:@"detail" sender:self];
    }
}


-(void)drawLine
{
    // CGPathRef myPath = [PocketSVG pathFromSVGFileNamed:[self title]];
//1: Turn your SVG into a CGPath:
    CGPathRef myPath = [PocketSVG pathFromSVGFileNamed:self.title];
    
    //2: To display it on screen, you can create a CAShapeLayer
    //and set myPath as its path property:
    CAShapeLayer *pathLayer = [CAShapeLayer layer];
    pathLayer.path = myPath;
    
    
   //pathLayer.frame = self.view.bounds;
    UIViewController *drawArea = self.childViewControllers.firstObject;
    pathLayer.frame = drawArea.view.bounds;
    
    
    //3: Fiddle with it using CAShapeLayer's properties:
    pathLayer.strokeColor = [[self imageColors][self.title] CGColor];
    pathLayer.lineWidth = 4;
    pathLayer.fillColor = [[UIColor clearColor] CGColor];

    pathLayer.position= [[self imagePoints][self.title]CGPointValue];
    
    //4: Display it!
    [self.view.layer addSublayer:pathLayer];
    
   // pathLayer.transform = CATransform3DMakeScale(0.3, 0.3, 0.3);
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration = 7.0;
    pathAnimation.repeatCount= NSIntegerMax;
    pathAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
    pathAnimation.toValue = [NSNumber numberWithFloat:1.0f];
    [pathLayer addAnimation:pathAnimation forKey:@"strokeEnd"];
}
@end
