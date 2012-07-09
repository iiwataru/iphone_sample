//
//  Toast.h
//  Toast
//
//  Created by 飯田 亘 on 12/07/05.
//  Copyright (c) 2012年 Tangit Corp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Toast:UIButton

- (id)initWithMessage:(NSString *)msg showTime:(float)sec parentView:(UIView *)parentview;
- (void)hide:(float)sec;
- (void)removeToast;

@end
