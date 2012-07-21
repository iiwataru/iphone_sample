//
//  SlideshowJs1ViewController.m
//  Slideshow2
//
//  Created by 飯田 亘 on 12/07/20.
//  Copyright (c) 2012年 Tangit Corp. All rights reserved.
//

#import "SlideshowJs1ViewController.h"

@interface SlideshowJs1ViewController ()

@end

@implementation SlideshowJs1ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.

    // Webview 生成
    webview = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 320, 300)];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"jsslide1_copy/pages/test" ofType:@"html"];
    [webview loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:path]]];
    [self.view addSubview:webview]; 
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 360, 100, 20)];
    [btn setTitle:@"表示" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(play)
  forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:btn];    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
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
    NSLog(@"setImages %d", [imageNames count]);
    
    listImages = imageNames;
}

/**
 * アニメーション実行
 */
- (void)play
{
    NSData *imageData = [[NSData alloc] init];
    NSString *document_path = [[NSString alloc] init];
    NSString *path = [[NSString alloc] init];
    NSMutableArray *imagePaths = [[NSMutableArray alloc] init];
    
    NSLog(@"listImages %d", [listImages count]);
    
    for (UIImage *image in listImages) {
        imageData = UIImageJPEGRepresentation(image, 0.1f);
        document_path = [NSHomeDirectory() stringByAppendingPathComponent:@"tmp"];
        path = [NSString stringWithFormat:@"%@/save_image%d.jpg", document_path, rand()];
        [imageData writeToFile:path atomically:YES];
        [imagePaths addObject:path];
        
        //        UIImage *img = [[UIImage alloc]initWithContentsOfFile:path];
        //        UIImageView *iv = [[UIImageView alloc]initWithImage:img];
        //        [self.view addSubview:iv];
    }
    
    // JSへアプリ内(tmp)の画像パスを登録
    [webview stringByEvaluatingJavaScriptFromString:@"initImage();"];
    
    for (int cnt = 0; cnt < [imagePaths count]; cnt++) {
        path = [imagePaths objectAtIndex:cnt];
        NSLog(@"%@", path);
        NSString *jsstr = [NSString stringWithFormat:@"addImage('%@');", path];
        [webview stringByEvaluatingJavaScriptFromString:jsstr];
        
    }

    [webview stringByEvaluatingJavaScriptFromString:@"play();"];
}

@end
