//
//  SlideshowSimpleViewController.m
//  Slideshow2
//
//  Created by 飯田 亘 on 12/07/15.
//  Copyright (c) 2012年 Tangit Corp. All rights reserved.
//

#import "SlideshowSimpleViewController.h"

@interface SlideshowSimpleViewController ()

@end

@implementation SlideshowSimpleViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.view.backgroundColor = [UIColor whiteColor];
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"natsu" ofType:@"mp3"];
        NSURL *url = [NSURL fileURLWithPath:path];
        audio = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void)viewWillDisappear:(BOOL)animated
{
    [audio stop];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

/**
 * 画像セット
 */
- (void)setImages:(NSMutableArray *)imageNames
{
    listImages = imageNames;
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
    
    // 音声再生
    [audio stop];
    [audio play];
}

/**
 * 次のアニメーション画像を投入
 */
- (void)next
{
    if ([listImages count] > 0
        && idxImage < [listImages count]) {
        
        // アニメーション画像追加
        AnimationImage *ai = [[AnimationImage alloc] initWithImage: CGRectMake(0, 0, 320, 460)
                                                             image:(UIImage *)[listImages objectAtIndex:idxImage]];
//        AnimationImage *ai = [[AnimationImage alloc] initWithImageName: CGRectMake(0, 0, 320, 460)
//                                                             imageName:(NSString *)[listImages objectAtIndex:idxImage]];
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
}

@end
