//
//  ViewController.h
//  Camera
//
//  Created by Tsutomu Ohta on 12/07/10.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
<UINavigationControllerDelegate,UIImagePickerControllerDelegate>
- (IBAction)startCamera:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *dispCamera;
@end
