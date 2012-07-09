//
//  ViewController.h
//  ImageEdit
//
//  Created by Tsutomu Ohta on 12/07/02.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EditImageView.h"

@interface ViewController : UIViewController
// EditImageView型のimageを宣言
@property (retain, nonatomic) IBOutlet EditImageView *image;
- (IBAction)button_push:(id)sender;
@property (retain, nonatomic) IBOutlet UIImageView *mix_image_view;
@end
