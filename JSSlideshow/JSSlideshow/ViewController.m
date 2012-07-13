//
//  ViewController.m
//  JSSlideshow
//
//  Created by Tsutomu Ohta on 12/07/13.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
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
    NSString *path = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"html"];
    [webview loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:path]]];
    /*NSString *image_path = @"1.jpeg";
    NSString *jsstr = [NSString stringWithFormat:@"setFirstImage('%@');", image_path];
    [webview stringByEvaluatingJavaScriptFromString:jsstr];*/
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

- (IBAction)startSlideshow:(id)sender {
    [webview stringByEvaluatingJavaScriptFromString:@"start_timer();"];
}
@end
