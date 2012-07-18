//
//  ViewController.h
//  SlideshowJavascript
//
//  Created by Tsutomu Ohta on 12/07/18.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ELCImagePickerController.h"
#import "ELCAlbumPickerController.h"

BOOL isSelectImage;
NSUInteger image_count;

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIWebView *webview;
- (IBAction)btnSlideStart:(id)sender;
- (IBAction)btnSelectImages:(id)sender;
@end
