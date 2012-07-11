//
//  Loading.m
//  Loading
//
//  Created by 飯田 亘 on 12/07/11.
//  Copyright (c) 2012年 Tangit Corp. All rights reserved.
//

#import "Loading.h"

const float MARGIN_X_BAR = 40.0f;
const float MARGIN_Y_BAR = 40.0f;

@implementation Loading

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        // 背景
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
        self.frame = CGRectMake(0.0, 100.0, frame.size.width, frame.size.height-100.0);
        
        // プログレスバー
        indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        indicator.frame = CGRectMake(MARGIN_X_BAR, MARGIN_Y_BAR + 10.0f, frame.size.width-MARGIN_X_BAR*2.0f, 20.0f);
        [self addSubview:indicator];
        
        // ラベル
        label = [[UILabel alloc] initWithFrame:CGRectMake(MARGIN_X_BAR, MARGIN_Y_BAR + 10.0f, frame.size.width-MARGIN_X_BAR*2.0f, 20.0f)];
        label.backgroundColor = [UIColor clearColor];
        label.textColor = [UIColor whiteColor];
        label.font = [UIFont systemFontOfSize:[UIFont systemFontSize]];
        [self addSubview:label];
    }
    self.alpha = 0.0;
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)setText:(NSString *)text {
    label.text = text;
}

- (void)start {
    // アニメーション
    [UIView beginAnimations:nil context:nil];  // 条件指定開始
    [UIView setAnimationDuration:0.3];  // 指定秒数でアニメーションを終了させる
    [UIView setAnimationDelay:0.0];  // アニメーションを開始する秒数
    self.alpha = 1.0;  // 終了状態を指定する
    [UIView commitAnimations];  // アニメーション開始！
    
    [indicator startAnimating];
}

- (void)stop {
    // アニメーション
    [UIView beginAnimations:nil context:nil];  // 条件指定開始
    [UIView setAnimationDuration:0.3];  // 指定秒数でアニメーションを終了させる
    [UIView setAnimationDelay:0.0];  // アニメーションを開始する秒数
    self.alpha = 0.0;  // 終了状態を指定する
    [UIView commitAnimations];  // アニメーション開始！
    
    [indicator stopAnimating];
}


@end
