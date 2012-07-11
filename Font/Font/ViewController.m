//
//  ViewController.m
//  Font
//
//  Created by 飯田 亘 on 12/07/11.
//  Copyright (c) 2012年 Tangit Corp. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize labelAnzu;
@synthesize labelSystem;
@synthesize textAnzu;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [labelAnzu setFont:[UIFont fontWithName:@"setofont" size:17]];
    [textAnzu setFont:[UIFont fontWithName:@"setofont" size:17]];
}

- (void)viewDidUnload
{
    [self setLabelAnzu:nil];
    [self setLabelSystem:nil];
    [self setTextAnzu:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
