//
//  ViewController.h
//  ZipArchive
//
//  Created by 飯田 亘 on 12/07/21.
//  Copyright (c) 2012年 Tangit Corp. All rights reserved.
//

#import <UIKit/UIKit.h>

NSString *zipPath = nil;
NSString *unzipPath = nil;

@interface ViewController : UIViewController

- (IBAction)buttonDl:(id)sender;
- (IBAction)buttonUnzip:(id)sender;
- (IBAction)buttonShowDir:(id)sender;

@end
