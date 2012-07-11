//
//  Loading.h
//  Loading
//
//  Created by 飯田 亘 on 12/07/11.
//  Copyright (c) 2012年 Tangit Corp. All rights reserved.
//

#import <UIKit/UIKit.h>

UIActivityIndicatorView *indicator;
UILabel *label;

@interface Loading : UIView

- (void)setText:(NSString *)text;
- (void)start;
- (void)stop;

@end
