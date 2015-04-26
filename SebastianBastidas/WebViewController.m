//
//  UkukuWebView.m
//  SebastianBastidas
//
//  Created by Sebastian Bastidas on 4/26/15.
//  Copyright (c) 2015 sbastidasr. All rights reserved.
//

#import "WebViewController.h"

@implementation WebViewController

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    NSURL *url = [NSURL URLWithString:self.strURL];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [self.webview loadRequest:urlRequest];
    
    [self.navigationController setNavigationBarHidden:NO];

}


@end
