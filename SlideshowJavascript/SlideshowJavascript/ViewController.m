//
//  ViewController.m
//  SlideshowJavascript
//
//  Created by Tsutomu Ohta on 12/07/18.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize webview;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSString *path = [[NSBundle mainBundle] pathForResource:@"www/pages/test" ofType:@"html"];
    [webview loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:path]]];
}

- (void)viewDidUnload
{
    [self setWebview:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

/**
 * スライドを開始する ボタンが押された時の処理
 */
- (IBAction)btnSlideStart:(id)sender {
    // 端末がiPhoneの場合
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        // ギャラリーから画像を選択されていた場合
        if (isSelectImage) {
            [self startSlideShow];
        } else {
            NSLog(@"イメージが選択されていません");
        }
    }
}

/**
 * 画像選択　ボタンが押された時の処理
 */
- (IBAction)btnSelectImages:(id)sender {
    // 端末がiPhoneの場合
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        isSelectImage = NO;
        ELCAlbumPickerController *elcAlbumPicker = [[ELCAlbumPickerController alloc] initWithNibName:@"ELCAlbumPickerController" bundle:[NSBundle mainBundle]];
        ELCImagePickerController *elcImagePicker = [[ELCImagePickerController alloc] initWithRootViewController:elcAlbumPicker];
        [elcAlbumPicker setParent:elcImagePicker];
        [elcImagePicker setDelegate:self];
        [self presentModalViewController:elcImagePicker animated:YES];
    }
}

/**
 * 画像を選択して戻って来た時の処理
 */
- (void)elcImagePickerController:(ELCImagePickerController *)picker didFinishPickingMediaWithInfo:(NSArray *)info {

    image_count = 1;
    [picker dismissModalViewControllerAnimated:YES];
    NSData *imageData = [[NSData alloc] init];
    NSString *document_path = [[NSString alloc] init];
    NSString *path = [[NSString alloc] init];

    for (NSDictionary *dict in info) {
        UIImage *image = [dict objectForKey:UIImagePickerControllerOriginalImage];
        imageData = UIImageJPEGRepresentation(image, 1.0f);
        document_path = [NSHomeDirectory() stringByAppendingPathComponent:@"tmp"];
        path = [NSString stringWithFormat:@"%@/save_image%d.jpg", document_path, image_count];
        [imageData writeToFile:path atomically:YES];
        image_count++;
    }
    isSelectImage = YES;
}

/**
 * 画像を選択せずに(キャンセルして)戻って来た時の処理
 */
- (void)elcImagePickerControllerDidCancel:(ELCImagePickerController *)picker {
    [picker dismissModalViewControllerAnimated:YES];
    isSelectImage = NO;
}

/**
 * JSへアプリ内(tmp)の画像パスを渡し、スライドショーをスタートさせる
 */
- (void)startSlideShow {

    NSString *document_path = [[NSString alloc] init];
    document_path = [NSHomeDirectory() stringByAppendingPathComponent:@"tmp"];
    NSString *path = [[NSString alloc] init];

    for (int cnt = 1; cnt < image_count; cnt++) {
        path = [NSString stringWithFormat:@"%@/save_image%d.jpg", document_path, cnt];
        NSString *jsstr = [NSString stringWithFormat:@"addImage('%@');", path];
        [webview stringByEvaluatingJavaScriptFromString:jsstr];
    }

    [webview stringByEvaluatingJavaScriptFromString:@"play();"];
}
@end
