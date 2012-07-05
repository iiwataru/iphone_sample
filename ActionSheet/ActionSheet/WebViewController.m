//
//  WebViewController.m
//  ActionSheet
//
//  Created by 飯田 亘 on 12/07/05.
//  Copyright (c) 2012年 Tangit Corp. All rights reserved.
//

#import "WebViewController.h"

@implementation WebViewController
@synthesize webview;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSLog(@"WebViewController loaded");
    
//    webview.delegate = self;
    NSString *urlText = [NSString stringWithString:
                         @"http://google.co.jp"];
    NSURL *url = [NSURL URLWithString:urlText];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webview loadRequest:request];
//    [self.view addSubview:webview];
}


- (void)viewDidUnload {
    [self setWebview:nil];
    [super viewDidUnload];
}
@end
