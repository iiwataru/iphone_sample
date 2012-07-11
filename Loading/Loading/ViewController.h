//
//  ViewController.h
//  Loading
//
//  Created by 飯田 亘 on 12/07/11.
//  Copyright (c) 2012年 Tangit Corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Loading.h"

Loading *loading = nil;

@interface ViewController : UIViewController

- (IBAction)buttonStart:(id)sender;
- (IBAction)buttonStop:(id)sender;
- (Loading *)getLoading;

@end
