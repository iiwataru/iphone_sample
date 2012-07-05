//
//  ViewController.m
//  MailerLaunch
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

- (IBAction)buttonMailer:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"mailto:hoge@hoge.com?Subject=fuga&body=test"]];
}

- (IBAction)buttonBrowser:(id)sender {
    NSURL *url = [NSURL URLWithString:@"http://www.yahoo.co.jp"];
    [[UIApplication sharedApplication] openURL:url];
}
@end
