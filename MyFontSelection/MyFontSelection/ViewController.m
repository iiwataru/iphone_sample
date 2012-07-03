//
//  ViewController.m
//  MyFontSelection
//
//  Created by 飯田 亘 on 12/07/03.
//  Copyright (c) 2012年 Tangit Corp. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize tf;
@synthesize labelAnzu;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSEnumerator *e = [[UIFont familyNames] objectEnumerator];
    NSString *font;
    while(font = [e nextObject]) {
        NSLog(@"%@: %@", font, [UIFont fontNamesForFamilyName:font]);
    }
    
    [labelAnzu setFont:[UIFont fontWithName:@"APJapanesefont.ttf" size:17]];
}

- (void)viewDidUnload
{
    [self setTf:nil];
    [self setLabelAnzu:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)buttonAnzu:(id)sender {
    [tf setFont:[UIFont fontWithName:@"APJapanesefont.ttf" size:24]];
}

- (IBAction)buttonSystem:(id)sender {
    [tf setFont:[UIFont systemFontOfSize:[UIFont systemFontSize]]]; 
}

- (IBAction)buttonAppleGothic:(id)sender {
    [tf setFont:[UIFont fontWithName:@"AppleGothic" size:17]];
}

- (IBAction)buttonCourier:(id)sender {
    [tf setFont:[UIFont fontWithName:@"Courier" size:17]];
}
@end
