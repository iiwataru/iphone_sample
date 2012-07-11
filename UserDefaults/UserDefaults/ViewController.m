//
//  ViewController.m
//  UserDefaults
//
//  Created by 飯田 亘 on 12/07/11.
//  Copyright (c) 2012年 Tangit Corp. All rights reserved.
//

#import "ViewController.h"
#import "UserDefaults.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize tf;
@synthesize lb;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // 初期化
    [UserDefaults initialize];
}

- (void)viewDidUnload
{
    [self setTf:nil];
    [self setLb:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)buttonSet:(id)sender {
    [UserDefaults set:@"USER_ID" value:tf.text];
    [lb setText: (NSString *)[UserDefaults get:@"USER_ID"]];
}

- (IBAction)buttonClear:(id)sender {
    [UserDefaults clear];
    [lb setText: (NSString *)[UserDefaults get:@"USER_ID"]];
}
@end
