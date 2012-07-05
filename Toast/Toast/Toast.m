//
//  Toast.m
//  Toast
//
//  Created by 飯田 亘 on 12/07/05.
//  Copyright (c) 2012年 Tangit Corp. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "Toast.h"

@implementation Toast

- (id)initWithMessage:(NSString *)msg showTime:(float)sec parentView:(UIView *)parentview
{
    UIFont *font = [UIFont systemFontOfSize:14];
    CGSize textSize = [msg sizeWithFont:font constrainedToSize:CGSizeMake(300, 50)];
    
    //ラベルの生成
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, textSize.width + 5, textSize.height + 5)];
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor whiteColor];
    label.font = font;
    label.text = msg;
    label.numberOfLines = 0;
//    label.shadowColor = [UIColor whiteColor];
//    label.shadowOffset = CGSizeMake(1, 1);
    
    // toast として使うボタンの生成
    self = [Toast buttonWithType:UIButtonTypeCustom];
    self.frame = CGRectMake(0, 0, textSize.width + 10, textSize.height + 10);
    label.center = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2);
    
    // label をボタンに登録する
    [self addSubview:label];
    
    //背景色の設定
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
    
    //角を丸くする設定
    [[self layer] setCornerRadius:4.0]; 
    [self setClipsToBounds:YES];
    
    CGPoint point = CGPointMake(parentview.frame.size.width/2, parentview.frame.size.height/2);
    point = CGPointMake(parentview.frame.size.width / 2, parentview.frame.size.height - 60);
    point = CGPointMake(point.x, point.y);
    self.center = point;
    
    //親画面に追加する
    [parentview addSubview:self];
    
    //タイマーにより自動的に非表示にする
    [self hide:sec];
    
    return self;
}

- (void)hide:(float)sec
{
    [UIView beginAnimations:nil context: NULL];
    [UIView setAnimationDuration:sec];
    [UIView setAnimationDelay:1.0];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(removeToast)];
    self.alpha = 0.0;
    
    [UIView commitAnimations];
}

- (void)removeToast
{
    self.hidden = YES;
    [self removeFromSuperview];
}

@end
