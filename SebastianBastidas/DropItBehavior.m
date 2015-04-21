//
//  DropItBehavior.m
//  Dropit
//
//  Created by Sebastian Bastidas on 3/16/15.
//  Copyright (c) 2015 sbastidasr. All rights reserved.
//

#import "DropItBehavior.h"

@interface DropItBehavior()
@property (strong, nonatomic) UIGravityBehavior *gravity;
@property (strong, nonatomic) UICollisionBehavior *collider;
@end
@implementation DropItBehavior

-(instancetype)init{
    self=[super init];
    [self addChildBehavior:self.gravity];
    [self addChildBehavior:self.collider];
    return self;
}

-(UIGravityBehavior *)gravity{
    if (!_gravity){
        _gravity=[[UIGravityBehavior alloc]init];
        _gravity.magnitude=0.9;
   //     [self.animator addBehavior:_gravity]; //if only adding this one to the animator, do this
    }
    return _gravity;
}

-(UICollisionBehavior *)collider{
    if(!_collider){
        _collider=[[UICollisionBehavior alloc]init];
        _collider.translatesReferenceBoundsIntoBoundary=YES;
       // [self.animator addBehavior:_collider];
    }
    return _collider;
}
-(void)addItem:(id <UIDynamicItem>)item{
     [self.gravity addItem:item];
    [self.collider addItem:item];
}
-(void)removeItem:(id <UIDynamicItem>)item{
    [self.gravity removeItem:item];
    [self.collider removeItem:item];
}

@end
