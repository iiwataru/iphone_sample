//
//  ViewController.h
//  EditImageUndo
//
//  Created by Tsutomu Ohta on 12/07/13.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TouchUIImageView.h"

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet TouchUIImageView *appleImage;
- (IBAction)undoImage:(id)sender;

@end
