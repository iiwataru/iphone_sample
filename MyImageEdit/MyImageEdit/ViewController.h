//
//  ViewController.h
//  MyImageEdit
//
//  Created by 飯田 亘 on 12/07/01.
//  Copyright (c) 2012年 Tangit Corp. All rights reserved.
//

#import <UIKit/UIKit.h>

UIImage *originalImage;

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *image;

- (IBAction)invertHorizontalButton:(id)sender;
- (IBAction)invertVerticalButton:(id)sender;
- (IBAction)leftButton:(id)sender;
- (IBAction)rightButton:(id)sender;
- (IBAction)originalButtln:(id)sender;
- (IBAction)monotoneButton:(id)sender;
- (IBAction)sepiaButton:(id)sender;
- (IBAction)invertColorButton:(id)sender;

- (UIImage*)grayscale:(UIImage*)anImage type:(char)type;

@end
