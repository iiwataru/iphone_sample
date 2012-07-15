//
//  ViewController.m
//  Slideshow1
//
//  Created by 飯田 亘 on 12/07/13.
//  Copyright (c) 2012年 Tangit Corp. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize buttonPlay;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // 表示画像リスト
    listImages = [[NSMutableArray alloc] init];
    [listImages addObject: @"umi1.jpeg"];
    [listImages addObject: @"umi2.jpeg"];
    [listImages addObject: @"umi3.jpeg"];
    [listImages addObject: @"umi4.jpeg"];
    [listImages addObject: @"umi5.jpeg"];
}

- (void)viewDidUnload
{
    [self setButtonPlay:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

/**
 * プレイボタン
 */
- (IBAction)buttonPlay:(id)sender {
    [self play];
}

/**
 * アニメーション実行
 */
- (void)play
{
    // 前回表示画像を削除
    for (UIView *v in [self.view subviews]) {
        if ([v isMemberOfClass:[UIImageView class]]) {
            [v removeFromSuperview];
        }
    }

    // 最初の画像から開始
    idxImage = 0;
    [self next];
    
    // プレイボタン非表示
    buttonPlay.hidden = YES;
}

/**
 * 次のアニメーション画像を投入
 */
- (void)next
{
    if ([listImages count] > 0
        && idxImage < [listImages count]) {
        
        // アニメーション画像追加
        AnimationImage *ai = [[AnimationImage alloc] initWithImageName:self.view.frame
                                                             imageName:(NSString *)[listImages objectAtIndex:idxImage]];
        [self.view addSubview:ai];
        [ai setCallback:self
   cbAnimationNextReady:@selector(callbackAnimationNextReady:)
   cbAnimationDidFinish:@selector(callbackAnimationDidFinish:)];  // コールバック指定
        [ai animationStart: (idxImage != 0)];

    }
    idxImage++;
}

/**
 * コールバック（次を実行）
 */
- (void)callbackAnimationNextReady:(AnimationImage *)ai
{
//    NSLog(@"callbackAnimationNextReady");
    [self next];
}

/**
 * コールバック（アニメーション終了時）
 */
- (void)callbackAnimationDidFinish:(AnimationImage *)ai
{
//    NSLog(@"callbackAnimationDidFinish");
    if (idxImage > [listImages count]) {
        buttonPlay.hidden = NO;
    }
}

@end
