//
//  ViewController.h
//  GallaryJS
//
//  Created by Tsutomu Ohta on 12/07/17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIWebView *webview;
@property (weak, nonatomic) IBOutlet UIImageView *imageview;
- (IBAction)getImage:(id)sender;
- (IBAction)dispImage:(id)sender;
@end
