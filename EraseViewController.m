//
//  EraseViewController.m
//  SebastianBastidas
//
//  Created by Sebastian Bastidas on 4/20/15.
//  Copyright (c) 2015 sbastidasr. All rights reserved.
//

#import "EraseViewController.h"
#import "EraseImageView.h"
@interface EraseViewController ()

@end

@implementation EraseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    EraseImageView* imageView = [[EraseImageView alloc]initWithFrame:self.view.frame];
    imageView.foregroundImage =  [UIImage imageNamed:@"color.png"];
    imageView.backgroundImage =  [UIImage imageNamed:@"colored.png"];
   
    self.view=imageView;
    
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
