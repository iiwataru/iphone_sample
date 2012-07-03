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
    // イメージを取得
    UIImage*    originalImage;
    originalImage = [info objectForKey:UIImagePickerControllerOriginalImage];
}

// イメージピッカーでキャンセルを押されたとき
- (void)imagePickerControllerDidCancel:(UIImagePickerController*)picker
{
	[self dismissModalViewControllerAnimated:YES];
}

- (IBAction)buttonGallery:(id)sender {
    UIImagePickerController*    imagePicker;
    imagePicker = [[UIImagePickerController alloc] init];
    //    [imagePicker autorelease];
    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    imagePicker.delegate = self;
    
    [self presentModalViewController:imagePicker animated:YES];
}



@end
