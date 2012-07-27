//
//  ViewController.m
//  CanvasMask
//
//  Created by Tsutomu Ohta on 12/07/25.
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

- (IBAction)fadeBlack:(id)sender {
    // 段々暗くなる処理を呼び出す
    [webview stringByEvaluatingJavaScriptFromString:@"initFadeBlack()"];
}

- (IBAction)fadeWhite:(id)sender {
    // 段々明るくなる処理を呼び出す
    [webview stringByEvaluatingJavaScriptFromString:@"initFadeWhite()"];
}
@end
