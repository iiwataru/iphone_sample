//
//  ViewController.m
//  GallerySelection
//
//  Created by 飯田 亘 on 12/07/04.
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
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

// イメージピッカーで画像を取得したとき
- (void)imagePickerController:(UIImagePickerController*)picker 
didFinishPickingMediaWithInfo:(NSDictionary*)info
{
    // 上限超えていなければ配列に追加
    if (imageArray.count < 4) {
        // イメージを取得
        UIImage*    originalImage;
        originalImage = [info objectForKey:UIImagePickerControllerOriginalImage];
        
        // 格納用配列に追加
        [imageArray addObject:originalImage];
        
    // 上限超えていたらメッセージ表示
    } else {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"エラー" 
                              message:@"写真は４枚までです" 
                              delegate:self 
                              cancelButtonTitle:nil 
                              otherButtonTitles:@"OK", nil];
        [alert show];
    }
    NSLog(@"%d", imageArray.count); 
}

// イメージピッカーでキャンセルを押されたとき
- (void)imagePickerControllerDidCancel:(UIImagePickerController*)picker
{
    // 画像配列の中身を出力
    NSUInteger i = 0;
    for (UIImage *img in imageArray) {
        NSLog(@"%d", img.hash);
        
        UIImageView *imageview = [[UIImageView alloc] initWithImage:img];
		[imageview setContentMode:UIViewContentModeScaleAspectFit];
        [imageview setFrame:CGRectMake(0, i*104, 100, 100)];
		[self.view addSubview:imageview];
        i++;
    }
    
	[self dismissModalViewControllerAnimated:YES];
}

// ギャラリーボタンを押されたとき
- (IBAction)buttonGallery:(id)sender {
    
    imageArray = [[NSMutableArray alloc] init];
    
    UIImagePickerController*    imagePicker;
    imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    imagePicker.delegate = self;
    
    [self presentModalViewController:imagePicker animated:YES];
}

@end
