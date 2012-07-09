//
//  ViewController.h
//  ImageSave2
//
//  Created by Tsutomu Ohta on 12/07/09.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *originImage;
@property (weak, nonatomic) IBOutlet UIImageView *dispImage;
- (IBAction)saveImage:(id)sender;
- (IBAction)printImage:(id)sender;

@end
