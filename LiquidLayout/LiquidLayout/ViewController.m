//
//  ViewController.m
//  LiquidLayout
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
    
    /**
     * 画面回転イベントを拾えるように設定
     */
    // 画面がどの方向になっているかを通知で受け取るのに必要
    //[[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    // どのイベント時にどのメソッドを呼ぶかを設定
    //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didDeviceRotate) name:UIDeviceOrientationDidChangeNotification object:nil];
}

- (void)viewDidUnload
{
    [self setWebview:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

/**
 * 画面回転終了を取得するイベント(デフォルトである)
 */
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    [webview stringByEvaluatingJavaScriptFromString:@"resizeCanvas();"];
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

/*
- (void)didDeviceRotate {
    //NSLog(@"画面が回転されました。");
    //[webview stringByEvaluatingJavaScriptFromString:@"resizeCanvas();"];
    //[webview stringByEvaluatingJavaScriptFromString:@"drawImageCanvas();"];
    //[webview stringByEvaluatingJavaScriptFromString:@"setResizeCanvasTimeout();"];
}
*/
@end