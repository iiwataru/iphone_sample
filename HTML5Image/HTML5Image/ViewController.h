//
//  ViewController.h
//  HTML5Image
//
//  Created by Tsutomu Ohta on 12/07/10.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *imageview;
- (IBAction)saveImage:(id)sender;
@property (weak, nonatomic) IBOutlet UIWebView *webview;
- (IBAction)loadHtml:(id)sender;

@end
