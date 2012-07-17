//
//  ViewController.h
//  CleanImage
//
//  Created by Tsutomu Ohta on 12/07/17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TouchUIImageView.h"

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet TouchUIImageView *originImage;
@property (weak, nonatomic) IBOutlet UIImageView *dispImage;
- (IBAction)btnCopy:(id)sender;
@end
