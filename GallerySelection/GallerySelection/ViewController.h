//
//  ViewController.h
//  GallerySelection
//
//  Created by 飯田 亘 on 12/07/04.
//  Copyright (c) 2012年 Tangit Corp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIActionSheetDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate>

- (IBAction)buttonGallery:(id)sender;
@end
