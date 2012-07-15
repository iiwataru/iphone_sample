//
//  ViewController.m
//  Slideshow2
//
//  Created by 飯田 亘 on 12/07/15.
//  Copyright (c) 2012年 Tangit Corp. All rights reserved.
//

#import "ViewController.h"
#import "SlideshowSimpleViewController.h"

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

/**
 * ギャラリーボタン
 */
- (IBAction)buttonGallery:(id)sender {
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        ELCAlbumPickerController *albumController = [[ELCAlbumPickerController alloc] initWithNibName:@"ELCAlbumPickerController" bundle:[NSBundle mainBundle]];
        ELCImagePickerController *elcPicker = [[ELCImagePickerController alloc] initWithRootViewController:albumController];
        [albumController setParent:elcPicker];
        [elcPicker setDelegate:self];
        [self presentModalViewController:elcPicker animated:YES];
    } else {
    }
}

/**
 * ギャラリー選択完了
 */
- (void)elcImagePickerController:(ELCImagePickerController *)picker didFinishPickingMediaWithInfo:(NSArray *)info{
    [picker dismissModalViewControllerAnimated:YES];
    
    // 前回表示画像を削除
    for (UIView *v in [self.view subviews]) {
        // UIImageView型であれば削除
        if ([v isMemberOfClass:[UIImageView class]]) {
            [v removeFromSuperview];
        }
    }
    
    // 選択画像を表示
    listImages = [[NSMutableArray alloc] init];
    NSUInteger i = 0;
	for(NSDictionary *dict in info) {
        
        // サムネイル表示
		UIImageView *imageview = [[UIImageView alloc] initWithImage:[dict objectForKey:UIImagePickerControllerOriginalImage]];
		[imageview setContentMode:UIViewContentModeScaleAspectFit];
        [imageview setFrame:CGRectMake(0, i*104, 100, 100)];
		[self.view addSubview:imageview];
        i++;
        
        // 選択画像リストに追加
        [listImages addObject:imageview.image];
    }
}

/**
 * ギャラリー選択キャンセル
 */
- (void)elcImagePickerControllerDidCancel:(ELCImagePickerController *)picker {
    [picker dismissModalViewControllerAnimated:YES];
}

/**
 * プレイボタン
 */
- (IBAction)buttonPlay:(id)sender {
    SlideshowSimpleViewController *slide = [[SlideshowSimpleViewController alloc] initWithNibName:nil bundle:nil];
    slide.title = @"Simple";
    [slide setImages: listImages];
    [self.navigationController pushViewController:slide animated:YES];
}

@end
