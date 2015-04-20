//
//  EraseImageView.m
//  SebastianBastidas
//
//  Created by Sebastian Bastidas on 4/20/15.
//  Copyright (c) 2015 sbastidasr. All rights reserved.
//

#import "EraseImageView.h"


@interface EraseImageView ()
- (void)createBitmapContext;
- (void)drawImageScaled:(UIImage *)image;
@end

@implementation EraseImageView
@synthesize touchRevealsImage=_touchRevealsImage, backgroundImage=_backgroundImage, foregroundImage=_foregroundImage, touchWidth=_touchWidth;

#pragma mark - Main methods -

- (void)createBitmapContext
{
    // create a grayscale colorspace
    CGColorSpaceRef grayscale=CGColorSpaceCreateDeviceGray();
    
    /* TO DO: instead of saving the bounds at the moment of creation,
     override setFrame:, create a new context with the right
     size, draw the previous on the new, and replace the old
     one with the new one.
     */
    contextBounds=self.bounds;
    
    // create a new 8 bit grayscale bitmap with no alpha (the mask)
    context=CGBitmapContextCreate(NULL,
                                  (size_t)contextBounds.size.width,
                                  (size_t)contextBounds.size.height,
                                  8,
                                  (size_t)contextBounds.size.width,
                                  grayscale,
                                  kCGImageAlphaNone);
    
    // make it white (touchRevealsImage==NO)
    CGFloat white[]={1., 1.};
    CGContextSetFillColor(context, white);
    
    CGContextFillRect(context, contextBounds);
    
    // setup drawing for that context
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetLineJoin(context, kCGLineJoinRound);
    
    CGColorSpaceRelease(grayscale);
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch=(UITouch *)[touches anyObject];
    
    // the new line that will be drawn
    CGPoint points[]={
        [touch previousLocationInView:self],
        [touch locationInView:self]
    };
    
    // setup width and color
    CGContextSetLineWidth(context, self.touchWidth);
    CGFloat color[]={(self.touchRevealsImage ? 1. : 0.), 1.};
    CGContextSetStrokeColor(context, color);
    
    // stroke
    CGContextStrokeLineSegments(context, points, 2);
    
    [self setNeedsDisplay];
    
}

- (void)drawRect:(CGRect)rect
{
    if (self.foregroundImage==nil || self.backgroundImage==nil) return;
    
    // draw background image
    [self drawImageScaled:self.backgroundImage];
    
    // create an image mask from the context
    CGImageRef mask=CGBitmapContextCreateImage(context);
    
    // set the current clipping mask to the image
    CGContextRef ctx=UIGraphicsGetCurrentContext();
    CGContextSaveGState(ctx);
    
    CGContextClipToMask(ctx, contextBounds, mask);
    
    // now draw image (with mask)
    [self drawImageScaled:self.foregroundImage];
    
    CGContextRestoreGState(ctx);
    
    CGImageRelease(mask);
    
}

- (void)resetDrawing
{
    // draw black or white
    CGFloat color[]={(self.touchRevealsImage ? 0. : 1.), 1.};
    
    CGContextSetFillColor(context, color);
    CGContextFillRect(context, contextBounds);
    
    [self setNeedsDisplay];
}

#pragma mark - Helper methods -

- (void)drawImageScaled:(UIImage *)image
{
    // just draws the image scaled down and centered
    /*
    CGFloat selfRatio=self.frame.size.width/self.frame.size.height;
    CGFloat imgRatio=image.size.width/image.size.height;
    
    CGRect rect={0.,0.,0.,0.};
    
    if (selfRatio>imgRatio) {
        // view is wider than img
        rect.size.height=self.frame.size.height;
        rect.size.width=imgRatio*rect.size.height;
    } else {
        // img is wider than view
        rect.size.width=self.frame.size.width;
        rect.size.height=rect.size.width/imgRatio;
    }
    
    rect.origin.x=.5*(self.frame.size.width-rect.size.width);
    rect.origin.y=.5*(self.frame.size.height-rect.size.height);
    */
   
    
    [image drawInRect:self.frame];
}

#pragma mark - Initialization and properties -

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self=[super initWithCoder:aDecoder])) {
        [self createBitmapContext];
        _touchWidth=20.;
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    if ((self=[super initWithFrame:frame])) {
        [self createBitmapContext];
        _touchWidth=60.;
    }
    return self;
}


- (void)setBackgroundImage:(UIImage *)value
{
    if (value!=_backgroundImage) {
        
        _backgroundImage=value;
        [self setNeedsDisplay];
    }
}

- (void)setForegroundImage:(UIImage *)value
{
    if (value!=_foregroundImage) {
        _foregroundImage=value;
        [self setNeedsDisplay];
    }
}

- (void)setTouchRevealsImage:(BOOL)value
{
    if (value!=_touchRevealsImage) {
        _touchRevealsImage=value;
        [self setNeedsDisplay];
    }
}

@end