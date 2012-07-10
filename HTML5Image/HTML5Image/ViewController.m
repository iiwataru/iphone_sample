//
//  ViewController.m
//  HTML5Image
//
//  Created by Tsutomu Ohta on 12/07/10.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize webview;
@synthesize imageview;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSString *path = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"html"];
    [webview loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:path]]];
}

- (void)viewDidUnload
{
    [self setImageview:nil];
    [self setWebview:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


/**
 * アプリ内へ画像を保存
 */
- (IBAction)saveImage:(id)sender {
    NSData *imageData = [[NSData alloc] init];
    imageData = UIImageJPEGRepresentation(self.imageview.image, 1.0f);
    
    // 保存先ディレクトリを取得する 今回はアプリ毎の固有データ扱いなのでDocumentsを使う
    NSString *document_path = [[NSString alloc] init];
    document_path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSString *path = [[NSString alloc] init];
    path = [NSString stringWithFormat:@"%@/save_image.jpg", document_path];
    
    BOOL success = NO;
    // 画像をDocumentsディレクトリへ保存する
    // atomically:YESにすると別名ファイルとして保存して成功した場合のみ上書き処理をするので途中で失敗しても元ファイルが破損することがない
    success = [imageData writeToFile:path atomically:YES];
    
    if (success) {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"画像の保存"
                              message:@"画像の保存に成功しました"
                              delegate:nil
                              cancelButtonTitle:nil
                              otherButtonTitles:@"OK", nil];
        [alert show];
    } else {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"画像の保存"
                              message:@"画像の保存に失敗しました"
                              delegate:nil
                              cancelButtonTitle:nil
                              otherButtonTitles:@"OK", nil];
        [alert show];
    }
}

- (IBAction)loadHtml:(id)sender {
    
//    [webview stringByEvaluatingJavaScriptFromString:@"alert('call from objective-c');"];
    
    // 保存先ディレクトリを取得する
    NSString *document_path = [[NSString alloc] init];
    document_path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSString *path = [[NSString alloc] init];
    path = [NSString stringWithFormat:@"%@/save_image.jpg", document_path];
    
//    NSData *dataImage = [[NSData alloc] initWithContentsOfMappedFile:path];
//    UIImage *image = [[UIImage alloc] initWithData:dataImage];
    
//    NSString *jsstr = @"dispImage(";
//    jsstr = [jsstr stringByAppendingString:path];
//    jsstr = [jsstr stringByAppendingString:@");"];
//    [webview stringByEvaluatingJavaScriptFromString:jsstr];

//    [webview stringByEvaluatingJavaScriptFromString:@"callAlert();"];
    NSString *jsstr = [NSString stringWithFormat:@"dispImage('%@');", path];
//    [webview stringByEvaluatingJavaScriptFromString:@"dispImage();"];
    [webview stringByEvaluatingJavaScriptFromString:jsstr];
}
@end
