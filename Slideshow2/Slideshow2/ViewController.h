//
//  ViewController.h
//  Slideshow2
//
//  Created by 飯田 亘 on 12/07/15.
//  Copyright (c) 2012年 Tangit Corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ELCImagePickerController.h"
#import "ELCAlbumPickerController.h"

NSMutableArray *listImages = nil;

@interface ViewController : UIViewController

- (IBAction)buttonGallery:(id)sender;
- (IBAction)buttonPlay:(id)sender;

@end
