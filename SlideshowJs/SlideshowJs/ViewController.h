//
//  ViewController.h
//  SlideshowJs
//
//  Created by 飯田 亘 on 12/07/17.
//  Copyright (c) 2012年 Tangit Corp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIWebView *webview;
- (IBAction)playButton:(id)sender;
- (IBAction)stopButton:(id)sender;

@end
