//
//  ViewController.m
//  LicenseAgree
//
//  Created by 飯田 亘 on 12/07/12.
//  Copyright (c) 2012年 Tangit Corp. All rights reserved.
//

#import "ViewController.h"
#import "UserDefaults.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize viewLicense;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // 同意済みなら規約画面を出さない
    if ([[UserDefaults get:@"LICENSE_AGREED"] isEqualToString:@"1"]) {
        viewLicense.hidden = YES;
    }

}

- (void)viewDidUnload
{
    [self setViewLicense:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

/**
 * クリアボタン：同意済みフラグをクリアする　→　次回起動時に規約画面を表示する
 */
- (IBAction)buttonClear:(id)sender {
    [UserDefaults clear];
}

/**
 * 同意するボタン
 */
- (IBAction)buttonAgree:(id)sender {
    // 同意フラグをON
    [UserDefaults set:@"LICENSE_AGREED" value:@"1"];
    
    // 規約画面を非表示にする
    viewLicense.hidden = YES;
}

/**
 * 同意しないボタン
 */
- (IBAction)buttonDisagree:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"注意"
                                                    message:@"規約に同意してください" 
                                                   delegate:self 
                                          cancelButtonTitle:nil 
                                          otherButtonTitles:@"OK", nil];
    [alert show];
}

@end
