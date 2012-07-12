//
//  TouchView.m
//  TouchCallback
//
//  Created by 飯田 亘 on 12/07/12.
//  Copyright (c) 2012年 Tangit Corp. All rights reserved.
//

#import "TouchView.h"

@implementation TouchView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        // 背景
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
        self.frame = CGRectMake(0.0, 50.0, 50.0, 50.0);
        
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
    NSLog(@"TouchView touchesBegan");
    [self caller:caller callback:callback];
}

- (void)setCallback:(id)cl cb:(SEL)cb
{
    caller = cl;
    callback = cb;
}

- (void) caller:(id) target callback:(SEL) callback{
    NSLog(@"TouchView caller");
    NSInvocation* invoker = [NSInvocation invocationWithMethodSignature:[target methodSignatureForSelector:callback]];
    [invoker setTarget:target];
    [invoker setSelector:callback];
    [invoker setArgument:(void *)&self atIndex:2];
    [invoker invoke];
}

- (void)setNumber:(NSInteger)i
{
    NSLog(@"TouchView setNumberImage - %d",i);
}


@end
