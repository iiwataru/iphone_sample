//
//  ViewController.m
//  ImageSave
//
//  Created by Tsutomu Ohta on 12/07/05.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize SaveImage;
@synthesize blueImage;
@synthesize redImage;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setBlueImage:nil];
    [self setRedImage:nil];
    [self setSaveImage:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)dealloc {
    [blueImage release];
    [redImage release];
    [SaveImage release];
    [super dealloc];
}

/**
 * アルバム内に青アサガオの画像保存
 */
- (IBAction)saveBlueImage:(id)sender {
    UIImage *blue = [[UIImage alloc] init];
    blue = blueImage.image;
NSLog(@"Call before:saveImage:blue");
    [self saveImage:blue];
    [blue release];
}

/**
 * アルバム内に赤アサガオの画像保存
 */
- (IBAction)saveRedImage:(id)sender {
    UIImage *red = [[UIImage alloc] init];
    red = redImage.image;
NSLog(@"Call before:saveImage:red");
    [self saveImage:red];
    [red release];
}

/**
 * アルバムへの画像保存処理
 */
- (void)saveImage:(UIImage *)image {
NSLog(@"Call before:UIImageWriteToSavedPhotosAlbum(image, self, @selector(savingImageIsFinished:didFinishedWithError:conetxtInfo:), nil)");
    UIImageWriteToSavedPhotosAlbum(image,
                                   self,
                                   @selector(savingImageIsFinished:didFinishedWithError:conetxtInfo:),
                                   nil);
}

/**
 * アルバムへの画像保存の成功時処理
 */
- (void)savingImageIsFinished:(UIImage *)image didFinishedWithError:(NSError *)error conetxtInfo:(void *)contextInfo {
NSLog(@"Call before:[alert show]");
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"画像の保存"
                          message:@"画像の保存に成功しました"
                          delegate:nil
                          cancelButtonTitle:nil
                          otherButtonTitles:@"OK", nil];
    [alert show];
    [alert release];
}

/**
 * アプリ内に青アサガオの画像保存
 */
- (IBAction)overwriteBlueImage:(id)sender {
    UIImage *blue = [[UIImage alloc] init];
    blue = blueImage.image;
NSLog(@"Call before:overwriteImage:blue");
    [self overwriteImage:blue];
    [blue release];
}

/**
 * アプリ内に赤アサガオの画像保存
 */
- (IBAction)overwriteRedImage:(id)sender {
    UIImage *red = [[UIImage alloc] init];
    red = blueImage.image;
NSLog(@"Call before:overwriteImage:red");
    [self overwriteImage:red];
    [red release];
}

/**
 * アプリへの画像保存処理
 */
- (void)overwriteImage:(UIImage *)image {

    // NSData型にイメージを入れる 1.0は圧縮率 参考サイトでは0.5f~0.7fで書かれていた
    NSData *dataImage = [[NSData alloc] init];
    dataImage = UIImageJPEGRepresentation(image, 1.0f);

    // 保存先ディレクトリを取得する 今回はアプリ毎の固有データ扱いなのでDocumentsを使う
    NSString *document_path = [[NSString alloc] init];
    document_path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSString *path = [[NSString alloc] init];
    path = [NSString stringWithFormat:@"%@/save_image.jpg", document_path];
    [document_path release];

    BOOL success = NO;
    // 画像をDocumentsディレクトリへ保存する
    // atomically:YESにすると別名ファイルとして保存して成功した場合のみ上書き処理をするので途中で失敗しても元ファイルが破損することがない
    success = [dataImage writeToFile:path atomically:YES];
    
    // 使い終わった変数のメモリ領域を解放
    [dataImage release];
    [path release];

    // 保存が成功した場合
    if (success) {
        UIAlertView *alert_success = [[UIAlertView alloc]
                              initWithTitle:@"画像の保存"
                              message:@"画像の保存に成功しました"
                              delegate:nil
                              cancelButtonTitle:nil
                              otherButtonTitles:@"OK", nil];
        NSLog(@"アラート表示");
        [alert_success show];
        NSLog(@"アラート表示終了");
        [alert_success release];
    }
    // 保存が失敗した場合
    else {
        UIAlertView *alert_failed = [[UIAlertView alloc]
                              initWithTitle:@"画像の保存"
                              message:@"画像の保存に失敗しました"
                              delegate:nil
                              cancelButtonTitle:nil
                              otherButtonTitles:@"OK", nil];
        [alert_failed show];
        [alert_failed release];
    }
}

/**
 * アプリ内に保存されている画像を取得する
 */
- (UIImage *)getSaveImage {

    // 保存先ディレクトリを取得する
    NSString *document_path = [[NSString alloc] init];
    document_path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSString *path = [[NSString alloc] init];
    path = [NSString stringWithFormat:@"%@/save_image.jpg", document_path];
    [document_path release];

    // 画像データを取得
    NSData *dataImage = [[NSData alloc] initWithContentsOfMappedFile:path];
    UIImage *image = [[UIImage alloc] initWithData:dataImage];

    // 使い終わった変数のメモリ領域を解放
    [path release];
    [dataImage release];

    // 取得した画像を返す
    return image;
}

/**
 * アプリ内に保存されている画像を表示
 */
- (IBAction)dispSaveImage:(id)sender {
    
    UIImage *image = [[UIImage alloc] init];
    
    // アプリ内に保存されている画像を取得
NSLog(@"Call before:getSaveImage");
    image = [self getSaveImage];
    
    // 画像を表示
    SaveImage.image = image;
}

- (IBAction)deleteDispSaveImage:(id)sender {
    SaveImage.image = nil;
}
@end