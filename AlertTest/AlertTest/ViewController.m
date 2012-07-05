//
//  ViewController.m
//  AlertTest
//
//  Created by 飯田 亘 on 12/07/05.
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

- (IBAction)buttonAlert:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert" 
                                                   message:@"What do you want to do?" 
                                                  delegate:self 
                                         cancelButtonTitle:@"Cancel" 
                                         otherButtonTitles:@"save", @"mail", @"upload", nil];
    [alert show];
//    [alert release];
    
    NSLog(@"1");
    
    
}
@end
