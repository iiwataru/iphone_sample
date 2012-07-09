//
//  ViewController.m
//  ProgressBar
//
//  Created by 飯田 亘 on 12/07/10.
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

- (IBAction)buttonShow:(id)sender {
    ProgressBar *pb = [self getProgress];
    [pb setText:@"test"];
    pb.hidden = NO;
}

- (IBAction)buttonHide:(id)sender {
    ProgressBar *pb = [self getProgress];
    pb.hidden = YES;
}

- (IBAction)buttonGo:(id)sender {
    ProgressBar *pb = [self getProgress];
    
    float progress = [pb getProgress] + 0.1;
    if (progress > 1.0) {
        progress = 0.0;
    }
    [pb setProgress:progress];
}

- (ProgressBar *)getProgress
{
    if (progress == nil) {
        progress = [[ProgressBar alloc] initWithFrame:self.view.frame];
        [self.view addSubview:progress];
    }
    return progress;
}
@end
