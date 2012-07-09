//
//  ProgressBar.h
//  ProgressBar
//
//  Created by 飯田 亘 on 12/07/10.
//  Copyright (c) 2012年 Tangit Corp. All rights reserved.
//

#import <UIKit/UIKit.h>

UIProgressView *pv;
UILabel *label;

@interface ProgressBar : UIView

- (void)setText:(NSString *)text;
- (void)setProgress:(float)progress;
- (float)getProgress;

@end
