//
//  ProgressBar.m
//  ProgressBar
//
//  Created by 飯田 亘 on 12/07/10.
//  Copyright (c) 2012年 Tangit Corp. All rights reserved.
//

#import "ProgressBar.h"

const float MARGIN_X_BAR = 40.0f;
const float MARGIN_Y_BAR = 40.0f;

@implementation ProgressBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        // 背景
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
        self.frame = CGRectMake(0.0, 100.0, frame.size.width, frame.size.height-100.0);
        
        // プログレスバー
        pv = [[UIProgressView alloc] initWithFrame:CGRectMake(MARGIN_X_BAR, MARGIN_Y_BAR, frame.size.width-MARGIN_X_BAR*2.0f, 0.0f)];
        pv.progressViewStyle = UIProgressViewStyleDefault;
        pv.progress = 0.0f;
        [self addSubview:pv];
        
        // ラベル
        label = [[UILabel alloc] initWithFrame:CGRectMake(MARGIN_X_BAR, MARGIN_Y_BAR + 10.0f, frame.size.width-MARGIN_X_BAR*2.0f, 20.0f)];
        label.backgroundColor = [UIColor clearColor];
        label.textColor = [UIColor whiteColor];
        label.font = [UIFont systemFontOfSize:[UIFont systemFontSize]];
        [self addSubview:label];
    
    }
    return self;
}

- (void)setText:(NSString *)text {
    label.text = text;
}

- (void)setProgress:(float)progress {
    pv.progress = progress;
}

- (float)getProgress {
    return pv.progress;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
