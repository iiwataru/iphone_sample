//
//  ViewController.h
//  Audio
//
//  Created by 飯田 亘 on 12/07/13.
//  Copyright (c) 2012年 Tangit Corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#include <AVFoundation/AVFoundation.h>  

AVAudioPlayer *audio = nil;

@interface ViewController : UIViewController

- (IBAction)buttonPlay:(id)sender;
- (IBAction)buttonPause:(id)sender;
@end
