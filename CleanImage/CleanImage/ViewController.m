//
//  ViewController.m
//  CleanImage
//
//  Created by Tsutomu Ohta on 12/07/17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize originImage;
@synthesize dispImage;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setOriginImage:nil];
    [self setDispImage:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)btnCopy:(id)sender {
    UIGraphicsBeginImageContext(CGSizeMake(originImage.bounds.size.width*4, originImage.bounds.size.height*4));
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextScaleCTM(context, 4.0, 4.0);
    [originImage.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    dispImage.image = img;
}
@end
