//
//  ViewController.m
//  TouchCallback
//
//  Created by 飯田 亘 on 12/07/12.
//  Copyright (c) 2012年 Tangit Corp. All rights reserved.
//

#import "ViewController.h"
#import "TouchView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    TouchView *tv = [[TouchView alloc] initWithFrame:self.view.frame];
    [tv setCallback:self cb:@selector(touchCallback:)];
    [self.view addSubview:tv];

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

- (void)touchCallback:(TouchView *)tv
{
    NSLog(@"touchCallback");
    imageCount++;
    [tv setNumber:imageCount];
}

@end
