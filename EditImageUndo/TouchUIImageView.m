//
//  TouchUIImageView.m
//  EditImageUndo
//
//  Created by Tsutomu Ohta on 12/07/13.
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
    UIImageView *stamp = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"apple.jpeg"]];
    CGPoint point = [[touches anyObject] locationInView:self];
    stamp.frame = CGRectMake(point.x, point.y, 100, 100);
    [self addSubview:stamp];
    
}

- (void)UndoSubView {
    [self.subviews.lastObject removeFromSuperview];
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
