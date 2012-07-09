//
//  AppDelegate.h
//  ImageEdit
//
//  Created by Tsutomu Ohta on 12/07/02.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EditImageView.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) EditImageView *image;

@end
