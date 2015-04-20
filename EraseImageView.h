//
//  EraseImageView.h
//  SebastianBastidas
//
//  Created by Sebastian Bastidas on 4/20/15.
//  Copyright (c) 2015 sbastidasr. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface EraseImageView : UIView {
    CGContextRef context;
    CGRect contextBounds;
}

@property (nonatomic, retain) UIImage *backgroundImage;
@property (nonatomic, retain) UIImage *foregroundImage;
@property (nonatomic, assign) CGFloat touchWidth;
@property (nonatomic, assign) BOOL touchRevealsImage;

- (void)resetDrawing;

@end
