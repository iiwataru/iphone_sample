//
//  EditImageView.m
//  ImageEdit
//
//  Created by Tsutomu Ohta on 12/07/02.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "EditImageView.h"

@implementation EditImageView

@synthesize stampView;
@synthesize stamp;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
    }
    return self;
}

//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//    //タッチイベントを許可する
//    self.userInteractionEnabled = YES;
//}

/**
 * タッチイベント
 */
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"タッチイベント開始");
    UIImageView *stampView = [[UIImageView alloc] init];
    NSLog(@"タッチロケーションの取得開始");
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    NSLog(@"タッチロケーションの取得終了");
    NSLog(@"取得したロケーションの表示開始");
    NSLog(@"x=%f", point.x);
    NSLog(@"y=%f", point.y);
    NSLog(@"取得したロケーションの表示終了");
    NSLog(@"描画用の画像を設定開始");
    stamp = [UIImage imageNamed:@"himawari.jpeg"];
    NSLog(@"描画用の画像を設定終了");
    NSLog(@"スタンプの開始");
    stampView.image = stamp;
    stampView.frame = CGRectMake(point.x - (stamp.size.width / 14),
                                        point.y - (stamp.size.width / 14),
                                        stamp.size.width/7,
                                        stamp.size.height/7
                                        );
    [self addSubview:stampView];
    NSLog(@"スタンプの終了");
    NSLog(@"タッチイベント終了");
}
@end
