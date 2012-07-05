//
//  ViewController.m
//  ParamSend
//
//  Created by Tsutomu Ohta on 12/07/04.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "SubViewController.h"

@interface ViewController () {
}

@end

@implementation ViewController
@synthesize txtUserInput;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [txtUserInput setDelegate:self];
}

- (void)viewDidUnload
{
    [self setTxtUserInput:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)dealloc {
    [txtUserInput release];
    [super dealloc];
}

- (BOOL)textFieldShouldReturn:(UITextField *)sender {
    [sender resignFirstResponder];
    return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    SubViewController
    *subViewController = (SubViewController *)[segue destinationViewController];
    subViewController.massage = txtUserInput.text;
}
@end
