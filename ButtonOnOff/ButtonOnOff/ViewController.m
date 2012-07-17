//
//  ViewController.m
//  ButtonOnOff
//
//  Created by Tsutomu Ohta on 12/07/17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIButton *btnImage = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, 180, 40)];
    [btnImage setImage:[UIImage imageNamed:@"apple.jpeg"] forState:UIControlStateNormal];
    [btnImage setImage:[UIImage imageNamed:@"himawari.jpeg"] forState:UIControlStateDisabled];
    [btnImage setTag:1];
    [self.view addSubview:btnImage];
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

- (IBAction)btnSwitch:(id)sender {
    UIButton *btn = (UIButton *)[self.view viewWithTag:1];
    [btn setEnabled:!btn.enabled];
}
@end
