//
//  SlideshowJs1ViewController.h
//  Slideshow2
//
//  Created by 飯田 亘 on 12/07/20.
//  Copyright (c) 2012年 Tangit Corp. All rights reserved.
//

#import <UIKit/UIKit.h>

NSMutableArray *listImages;
NSInteger idxImage;
UIWebView *webview;

@interface SlideshowJs1ViewController : UIViewController

- (void)setImages:(NSMutableArray *)imageNames;

@end
