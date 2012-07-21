//
//  AnimationImage.h
//  Slideshow1
//
//  Created by 飯田 亘 on 12/07/15.
//  Copyright (c) 2012年 Tangit Corp. All rights reserved.
//

#import <UIKit/UIKit.h>

UIImageView *iv;
id caller;
SEL callbackAnimationNextReady;
SEL callbackAnimationDidFinish;

@interface AnimationImage : UIView

- (id)initWithImageName:(CGRect)frame imageName:(NSString *)imageName;
- (id)initWithImage:(CGRect)frame image:(UIImage *)image;
- (void)animationStart:(BOOL)withDelay;
- (void)setCallback:(id)cl cbAnimationNextReady:(SEL)cbAnimationNextReady cbAnimationDidFinish:(SEL)cbAnimationDidFinish;

@end
