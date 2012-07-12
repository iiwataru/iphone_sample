//
//  TouchUIImageVIew.m
//  ImageSelection
//
//  Created by Tsutomu Ohta on 12/07/12.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "TouchUIImageVIew.h"
#import <QuartzCore/QuartzCore.h>

@implementation TouchUIImageVIew
@synthesize isSelected;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        //self.userInteractionEnabled = YES;
        isSelected = NO;
    }
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

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"タッチイベントは取れてるみたいだよ");
    [self setBorderLine];
}

- (void)setBorderLine {
    CALayer *layer = self.layer;
    if (!isSelected) {
        [layer setBorderWidth:3.0f];
        [layer setBorderColor:[[UIColor brownColor] CGColor]];
    } else {
        [layer setBorderWidth:0.0f];
    }
    isSelected = !isSelected;
}
@end
