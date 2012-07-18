//
//  ViewController.m
//  ThumbnailSlide
//
//  Created by Tsutomu Ohta on 12/07/18.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "TouchUIImageView.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize scrollview;
@synthesize imageview;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [scrollview setContentSize:CGSizeMake(440,50)];
    NSInteger count;
    for (count = 1; count < 8; count++) {
        TouchUIImageView *viewImage = [[TouchUIImageView alloc] initWithFrame:
                                       CGRectMake(50*count, 10, 40, 40)];
        [viewImage setUserInteractionEnabled:YES];
        [viewImage setImage:[UIImage imageNamed:[NSString stringWithFormat:@"0%d.jpeg",count]]];
        
        [scrollview addSubview:viewImage];
    }
}

- (void)viewDidUnload
{
    [self setScrollview:nil];
    [self setImageview:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
