//
//  ViewController.m
//  Camera
//
//  Created by Tsutomu Ohta on 12/07/10.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize dispCamera;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setDispCamera:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

/**
 * カメラ起動処理
 */
- (IBAction)startCamera:(id)sender {
    
    // カメラ機能が使えない場合
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        NSLog(@"カメラ機能が使えない端末だからカメラ起動できないよ・w・");
        return;
    }
    // カメラ機能が使える場合
    else {
        // UIImagePickerControllerの変数の領域を確保＆初期化
        UIImagePickerController *img_pick_contoroller = [[UIImagePickerController alloc] init];
        
        // カメラを指定
        img_pick_contoroller.sourceType = UIImagePickerControllerSourceTypeCamera;
        img_pick_contoroller.delegate = self;
        
        // 編集可能かどうかを指定する
        img_pick_contoroller.allowsEditing = NO;
        
        // カメラを起動
        [self presentModalViewController:img_pick_contoroller animated:YES];
    }
}

/**
 * カメラキャンセル時
 */
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self dismissModalViewControllerAnimated:YES];
}

/**
 * カメラOK時
 */
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo {
    [self dismissModalViewControllerAnimated:YES];
    dispCamera.image = image;
}
@end