//
//  ViewController.m
//  SlideshowJs2
//
//  Created by 飯田 亘 on 12/07/17.
//  Copyright (c) 2012年 Tangit Corp. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize webview;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    NSString *path = [[NSBundle mainBundle] pathForResource:@"www/pages/test" ofType:@"html"];
    [webview loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:path]]];
}

- (void)viewDidUnload
{
    [self setWebview:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)playButton:(id)sender {
    [webview stringByEvaluatingJavaScriptFromString:@"setImages(['../img/umi1.jpeg','../img/umi2.jpeg','../img/umi3.jpeg','../img/umi4.jpeg','../img/umi5.jpeg']);"];
    [webview stringByEvaluatingJavaScriptFromString:@"play();"];
}
- (IBAction)stopButton:(id)sender {
    [webview stringByEvaluatingJavaScriptFromString:@"stop();"];
}
@end
