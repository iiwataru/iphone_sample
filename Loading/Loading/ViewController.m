//
//  ViewController.m
//  Loading
//
//  Created by 飯田 亘 on 12/07/11.
//  Copyright (c) 2012年 Tangit Corp. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

/**
 * ローディングインスタンス取得
 */
- (Loading *)getLoading
{
    if (loading == nil) {
        loading = [[Loading alloc] initWithFrame:self.view.frame];
        [loading setText:@"test"];
        [self.view addSubview:loading];
    }
    return loading;
}

/**
 * ローディング開始
 */
- (IBAction)buttonStart:(id)sender {
    [[self getLoading] start];
}

/**
 * ローディング終了
 */
- (IBAction)buttonStop:(id)sender {
    [[self getLoading] stop];
}

@end
