//
//  SlideshowSimpleViewController.h
//  Slideshow2
//
//  Created by 飯田 亘 on 12/07/15.
//  Copyright (c) 2012年 Tangit Corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AnimationImage.h"

#import <AVFoundation/AVFoundation.h>  

static AVAudioPlayer *audio = nil;

NSMutableArray *listImages;
NSInteger idxImage;

@interface SlideshowSimpleViewController : UIViewController

- (void)setImages:(NSMutableArray *)imageNames;

@end
