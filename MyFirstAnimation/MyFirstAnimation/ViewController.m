//
//  ViewController.m
//  MyFirstAnimation
//
//  Created by 飯田 亘 on 12/07/02.
//  Copyright (c) 2012年 Tangit Corp. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

/**
 * ボタンアクション
 */
- (IBAction)animationRectButton:(id)sender {
    [self animateWithRect];
}

- (IBAction)animationImageButton:(id)sender {
    [self animateWithImage];
}

/**
 * アニメーション実行 四角形描画
 * http://iphone-tora.sakura.ne.jp/uiview.html
 */
- (void)animateWithRect
{
    NSLog(@"アニメーション開始　四角形");
    
    // UIViewの生成
    UIView *uv = [[UIView alloc] init];
    uv.frame = CGRectMake(0,0,50,50);
    uv.backgroundColor = [UIColor redColor];
    [self.view addSubview:uv];
    
    // アニメーション
    [UIView beginAnimations:nil context:(void *)uv];  // 条件指定開始
    [UIView setAnimationDuration:1.0];  // 2秒かけてアニメーションを終了させる
    [UIView setAnimationDelay:0.2];  // アニメーションを開始する秒数
    [UIView setAnimationRepeatCount:1.0];  // アニメーションを繰り返す
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];  // アニメーション
    [UIView setAnimationDelegate:self];// アニメーション終了時コールバックデリゲート
    [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];// アニメーション終了時コールバックメソッド
    uv.center = CGPointMake(200, 400);  // 終了位置を200,400の位置に指定する
    [UIView commitAnimations];  // アニメーション開始！
    
}

- (void)animationDidStop
{
    NSLog(@"アニメーション終了したよ。A");
    //    [context release];
}

- (void)animationDidStop:(NSString *)animationID  finished:(BOOL)finished  context:(void *)context
{
    NSLog(@"アニメーション終了したよ。B");
    ((__bridge UIView *)context).alpha = 0.0;
}


/**
 * アニメーション実行 画像
 * http://iphone-tora.sakura.ne.jp/uiview.html
 */
- (void)animateWithImage
{
    // 画像読み込み
    UIImage *img = [UIImage imageNamed:@"uniqlo.jpg"];
    UIImageView *iv = [[UIImageView alloc] initWithImage:img];
    iv.frame = CGRectMake(0, 0, 100, 100);  // 100x100サイズのUIImageViewを作成し
    iv.center = CGPointMake(50, 50);  // 50,50の位置に配置する
    [self.view addSubview:iv];

    // アニメーション
    [UIView beginAnimations:nil context:nil];  // 条件指定開始
    [UIView setAnimationDuration:2.0];  // 2秒かけてアニメーションを終了させる
    [UIView setAnimationDelay:0.5];  // アニメーションをディレイする
    [UIView setAnimationRepeatCount:3.0];  // アニメーションを繰り返す
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];  // アニメーション
    
    iv.center = CGPointMake(200, 400);  // 終了位置を200,400の位置に指定する
	iv.alpha = (CGFloat)0.0;
    
    [UIView commitAnimations];  // アニメーション開始！
    
}

@end
