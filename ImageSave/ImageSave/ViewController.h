//
//  ViewController.h
//  ImageSave
//
//  Created by Tsutomu Ohta on 12/07/05.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (retain, nonatomic) IBOutlet UIImageView *blueImage;
@property (retain, nonatomic) IBOutlet UIImageView *redImage;
- (IBAction)saveBlueImage:(id)sender;
- (IBAction)saveRedImage:(id)sender;
- (IBAction)overwriteBlueImage:(id)sender;
- (IBAction)overwriteRedImage:(id)sender;
- (IBAction)dispSaveImage:(id)sender;
- (IBAction)deleteDispSaveImage:(id)sender;
@property (retain, nonatomic) IBOutlet UIImageView *SaveImage;
@end
