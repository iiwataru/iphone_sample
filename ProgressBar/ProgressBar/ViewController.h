//
//  ViewController.h
//  ProgressBar
//
//  Created by 飯田 亘 on 12/07/10.
//  Copyright (c) 2012年 Tangit Corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProgressBar.h"

ProgressBar *progress = nil;

@interface ViewController : UIViewController
- (IBAction)buttonShow:(id)sender;
- (IBAction)buttonHide:(id)sender;
- (IBAction)buttonGo:(id)sender;

@end
