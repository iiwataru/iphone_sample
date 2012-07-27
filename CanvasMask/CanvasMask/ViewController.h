//
//  ViewController.h
//  CanvasMask
//
//  Created by Tsutomu Ohta on 12/07/25.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIWebView *webview;
- (IBAction)fadeBlack:(id)sender;
- (IBAction)fadeWhite:(id)sender;
@end
