//
//  TouchUIImageView.m
//  ImageSort
//
//  Created by Tsutomu Ohta on 12/07/12.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "TouchUIImageView.h"
#import <QuartzCore/QuartzCore.h>

@implementation TouchUIImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        isSelected = NO;
        // Initialization code
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    if (!isSelected) {
        retNum = [self caller:caller callback:callback];
        [self.layer setBorderWidth:3.0f];
        [self.layer setBorderColor:[[UIColor brownColor] CGColor]];
        UIImageView *numImg = [[UIImageView alloc] init];
        numImg.frame = CGRectMake(10, 10, 20, 20);
        switch (retNum) {
            case 1:
                numImg.image = [UIImage imageNamed:@"number_1.png"];
                break;
            case 2:
                numImg.image = [UIImage imageNamed:@"number_2.png"];
                break;
            case 3:
                numImg.image = [UIImage imageNamed:@"number_3.png"];
                break;
            case 4:
                numImg.image = [UIImage imageNamed:@"number_4.png"];
                break;
            case 5:
                numImg.image = [UIImage imageNamed:@"number_5.png"];
                break;
            case 6:
                numImg.image = [UIImage imageNamed:@"number_6.png"];
                break;
            default:
                break;
        }
        [self addSubview:numImg]; 
    } else {
        // TODO 選択取り消し処理
    }
}

- (void)setCallback:(id)cl cb:(SEL)cb {
    caller = cl;
    callback = cb;
}

- (int)caller:(id)target callback:(SEL)callback {
    NSInvocation *invoker = [NSInvocation invocationWithMethodSignature:[target methodSignatureForSelector:callback]];
    [invoker setTarget:target];
    [invoker setSelector:callback];
    [invoker setArgument:(void *)&self atIndex:2];
    //[invoker setArgument:(void *)&isSelected atIndex:3];
    [invoker invoke];
    [invoker getReturnValue:(void *)&retNum];
    return retNum;
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
