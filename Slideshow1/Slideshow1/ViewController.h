//
//  ViewController.h
//  Slideshow1
//
//  Created by 飯田 亘 on 12/07/13.
//  Copyright (c) 2012年 Tangit Corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AnimationImage.h"

//UIView *baseview;
NSMutableArray *listImages;
NSInteger idxImage = 0;

@interface ViewController : UIViewController

- (IBAction)buttonPlay:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *buttonPlay;

@end
