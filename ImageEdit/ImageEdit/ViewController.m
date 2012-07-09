//
//  ViewController.m
//  ImageEdit
//
//  Created by Tsutomu Ohta on 12/07/02.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize mix_image_view;
@synthesize image;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setImage:nil];
    [self setMix_image_view:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)dealloc {
    [image release];
    [mix_image_view release];
    [super dealloc];
}
- (IBAction)button_push:(id)sender {
    UIGraphicsBeginImageContext(image.frame.size);
    [image.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    mix_image_view.image = img;
}
@end
