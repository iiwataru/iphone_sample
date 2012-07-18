//
//  TouchUIImageView.m
//  ThumbnailSlide
//
//  Created by Tsutomu Ohta on 12/07/18.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "TouchUIImageView.h"

@implementation TouchUIImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"タッチされたよ！");
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
