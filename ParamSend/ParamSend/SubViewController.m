//
//  SubViewController.m
//  ParamSend
//
//  Created by Tsutomu Ohta on 12/07/04.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "SubViewController.h"

@interface SubViewController ()

@end

@implementation SubViewController
@synthesize massage;
@synthesize lblMassage;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    // 文字が入力されていない場合
    if ([massage isEqualToString:@""]) {
        lblMassage.text = @"ERROR!! : 文字が入力されていません"; 
    }
    // 文字が入力されている場合
    else {
        lblMassage.text = massage;
    }
}

- (void)viewDidUnload
{
    [self setLblMassage:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [lblMassage release];
    [super dealloc];
}
@end
