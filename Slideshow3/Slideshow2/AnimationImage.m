//
//  AnimationImage.m
//  Slideshow1
//
//  Created by 飯田 亘 on 12/07/15.
//  Copyright (c) 2012年 Tangit Corp. All rights reserved.
//

#import "AnimationImage.h"

const float IMAGE_FIT_WIDTH = 240.0;
const float IMAGE_FIT_HEIGHT = 240.0;
const float IMAGE_MARGIN = 10.0;
const float ANIMATION_DURATION = 1.0;
const float ANIMATION_DELAY = 2.5;
const int ANIMATION_CURVE = UIViewAnimationCurveEaseIn;

@implementation AnimationImage

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/**
 * 画像名で初期化
 */
- (id)initWithImageName:(CGRect)frame imageName:(NSString *)imageName
{
    UIImage *image = [UIImage imageNamed:imageName];
//    UIImage *image = [[UIImage alloc]initWithContentsOfFile:imageName];
    return [self initWithImage:frame image:image];
}

/**
 * 画像で初期化
 */
- (id)initWithImage:(CGRect)frame image:(UIImage *)image
{
    self = [self initWithFrame:frame];
    
    iv = [[UIImageView alloc] initWithImage:image];
    iv.contentMode = UIViewContentModeScaleAspectFit;
    iv.frame = CGRectMake((self.frame.size.width - IMAGE_FIT_WIDTH) / 2.0, 0.0, IMAGE_FIT_WIDTH, IMAGE_FIT_HEIGHT);
    [self addSubview:iv];
    
    // 最初は非表示
    self.alpha = 0.0;
    
    // 最初は右位置からスタート
    self.center = CGPointMake(self.center.x + IMAGE_FIT_WIDTH + IMAGE_MARGIN, self.center.y);
    return self;
}


/**
 * アニメーション開始
 */
- (void)animationStart:(BOOL)withInitialDelay
{
    [self animation1:withInitialDelay];
}

/**
 * アニメーション１（右から中央へ）
 */
- (void)animation1:(BOOL)withDelay
{
    [UIView beginAnimations:nil context:(void *)iv];  // 条件指定開始
    [UIView setAnimationDuration:ANIMATION_DURATION];
    if (withDelay) {
        [UIView setAnimationDelay:ANIMATION_DELAY];  // 開始を遅らせるかどうか
    }
    [UIView setAnimationCurve:ANIMATION_CURVE];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(animationDidStop1:finished:context:)];
    self.alpha = 1.0;
    self.center = CGPointMake(self.frame.size.width / 2.0, self.center.y); // 中央へ
    [UIView commitAnimations];
}
- (void)animationDidStop1:(NSString *)animationID  finished:(BOOL)finished  context:(void *)context
{
    [self animation2];
    [self caller:caller callback:callbackAnimationNextReady];  // コールバック実行（次の画像を表示）
}

/**
 * アニメーション２（中央から左へ）
 */
- (void)animation2
{
    [UIView beginAnimations:nil context:(void *)iv];  // 条件指定開始
    [UIView setAnimationDuration:ANIMATION_DURATION];
    [UIView setAnimationDelay:ANIMATION_DELAY];
    [UIView setAnimationCurve:ANIMATION_CURVE];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(animationDidStop2:finished:context:)];
    self.alpha = 0.0;
    self.center = CGPointMake(self.center.x - IMAGE_FIT_WIDTH - IMAGE_MARGIN, self.center.y); // 左へ
    [UIView commitAnimations];
}
- (void)animationDidStop2:(NSString *)animationID  finished:(BOOL)finished  context:(void *)context
{
    // アニメーション終了時処理
    [self caller:caller callback:callbackAnimationDidFinish];  // コールバック実行（アニメーション終了）
}

/**
 * コールバック指定
 */
- (void)setCallback:(id)cl cbAnimationNextReady:(SEL)cbAnimationNextReady cbAnimationDidFinish:(SEL)cbAnimationDidFinish
{
    caller = cl;
    callbackAnimationNextReady = cbAnimationNextReady;
    callbackAnimationDidFinish = cbAnimationDidFinish;
}

/**
 * コールバック実行
 */
- (void) caller:(id) target callback:(SEL) callback{
//    NSLog(@"AnimationImage caller");
    NSInvocation* invoker = [NSInvocation invocationWithMethodSignature:[target methodSignatureForSelector:callback]];
    [invoker setTarget:target];
    [invoker setSelector:callback];
    [invoker setArgument:(void *)&self atIndex:2];
    [invoker invoke];
}

@end
