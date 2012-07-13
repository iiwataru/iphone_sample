//
//  ViewController.h
//  JSSlideshow
//
//  Created by Tsutomu Ohta on 12/07/13.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

int nextImageNumber;
NSArray *path_list;

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIWebView *webview;
- (IBAction)startSlideshow:(id)sender;
@end
