//
//  ViewController.m
//  ActionSheet
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

- (IBAction)buttonActionSheet:(id)sender {
    UIActionSheet *sheet = [[UIActionSheet alloc ] init ];
    sheet.delegate = self;
    [sheet addButtonWithTitle:@"WebView"];
    [sheet addButtonWithTitle:@"Cancel"];
    sheet.cancelButtonIndex = 1;
    [sheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if (buttonIndex==0){
        NSLog(@"button 0");
        
//        UIViewController *wv = [[WebViewController alloc] initWithNibName:@"webview" bundle:nil];
        WebViewController *wv = [self.storyboard instantiateViewControllerWithIdentifier:@"WebViewController"];
        [self.navigationController pushViewController:wv animated:YES];
        
    }
}
@end
