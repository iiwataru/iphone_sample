//
//  ELCImagePickerDemoAppDelegate.h
//  ELCImagePickerDemo
//
//  Created by Collin Ruffenach on 9/9/10.
//  Copyright 2010 ELC Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ELCImagePickerDemoViewController;

@interface ELCImagePickerDemoAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    ELCImagePickerDemoViewController *viewController;
}

@property (nonatomic) IBOutlet UIWindow *window;
@property (nonatomic) IBOutlet ELCImagePickerDemoViewController *viewController;

@end

