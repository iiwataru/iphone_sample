//
//  ViewController.h
//  MyFirstAnimation
//
//  Created by 飯田 亘 on 12/07/02.
//  Copyright (c) 2012年 Tangit Corp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
- (IBAction)animationRectButton:(id)sender;
- (IBAction)animationImageButton:(id)sender;

- (void)animateWithRect;
- (void)animateWithImage;
- (void)animationDidStop;
- (void)animationDidStop:(NSString *)animationID  finished:(BOOL)finished  context:(void *)context;

@end
