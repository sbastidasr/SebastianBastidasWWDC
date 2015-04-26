//
//  UkukuWebView.h
//  SebastianBastidas
//
//  Created by Sebastian Bastidas on 4/26/15.
//  Copyright (c) 2015 sbastidasr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIWebView *webview;
@property (strong, nonatomic) NSString *strURL;
@end
