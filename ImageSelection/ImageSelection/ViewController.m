//
//  ViewController.m
//  ImageSelection
//
//  Created by Tsutomu Ohta on 12/07/12.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()

@end

@implementation ViewController
@synthesize selectImage1;
@synthesize selectImage2;
@synthesize selectImage3;
@synthesize selectImage4;
@synthesize selectImage5;
@synthesize selectImage6;
@synthesize testview;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [testview.layer setBorderColor:[[UIColor brownColor] CGColor]];
    [testview.layer setBorderWidth:5.0f];
}

- (void)viewDidUnload
{
    [self setSelectImage1:nil];
    [self setSelectImage2:nil];
    [self setSelectImage3:nil];
    [self setSelectImage4:nil];
    [self setSelectImage5:nil];
    [self setSelectImage6:nil];
    [self setTestview:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}
@end
