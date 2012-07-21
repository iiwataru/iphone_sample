//
//  ViewController.m
//  Slideshow2
//
//  Created by 飯田 亘 on 12/07/15.
//  Copyright (c) 2012年 Tangit Corp. All rights reserved.
//

#import "ViewController.h"
#import "SlideshowSimpleViewController.h"
#import "SlideshowJs1ViewController.h"
#import "SlideshowDlViewController.h"
#import "ZipArchive/ZipArchive.h"

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
        
        NSLog(@"%@", info);
        
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

- (IBAction)buttonPlayJs1:(id)sender {
    NSLog(@"buttonPlayJs1");
    SlideshowJs1ViewController *slide = [[SlideshowJs1ViewController alloc] initWithNibName:nil bundle:nil];
    slide.title = @"Js1";
    [slide setImages: listImages];
    [self.navigationController pushViewController:slide animated:YES];
}

/**
 * 一時ディレクトリを表示
 */
- (IBAction)buttonShowDir:(id)sender {
    NSString *dir = [NSHomeDirectory() stringByAppendingPathComponent:@"tmp"];
    NSLog(@"%@", dir);
    
    // http://azukisoft.blogspot.jp/2010/06/is-deprecated.html
    NSFileManager *fm = [NSFileManager defaultManager];
    NSDirectoryEnumerator *dirEnum = [fm enumeratorAtPath:dir];
    
    NSLog(@"--- Show Directory START ---");
    
    NSString *fname;
    while (fname = [dirEnum nextObject])
    {
        NSLog(@"%@", fname);
    }
    
    NSLog(@"--- Show Directory END ---");
}

/**
 * テンプレートをダウンロード
 */
- (IBAction)buttonTemplateDl:(id)sender {
    if (templatePath == nil) {

        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        
        // DL
        NSURL *url = [NSURL URLWithString:@"https://dl.dropbox.com/u/717602/test/pic/jsslide1_copy.zip"];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        NSURLResponse *response = nil;
        NSError *error = nil;
        NSData *data = [NSURLConnection sendSynchronousRequest : request
                                             returningResponse : &response
                                                         error : &error
                        ];
        
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        
        // DL Error
        NSString *error_str = [error localizedDescription];
        if (0<[error_str length]) {
            UIAlertView *alert = [
                                  [UIAlertView alloc]
                                  initWithTitle : @"RequestError"
                                  message : error_str
                                  delegate : nil
                                  cancelButtonTitle : @"OK"
                                  otherButtonTitles : nil
                                  ];
            [alert show];

        // DL Success
        } else {
            
            // Save
            NSString *dir = [[NSString alloc] init];
            dir = [NSHomeDirectory() stringByAppendingPathComponent:@"tmp"];
            NSString *filename = [NSString stringWithFormat:@"zip%d.zip", rand()];
            NSString *zipPath = [dir stringByAppendingPathComponent:filename];
            
            NSLog(@"%@",zipPath);
            
            BOOL success = NO;
            success = [data writeToFile:zipPath atomically:YES];
            
            // Save Success
            if (success) {
                NSLog(@"Download OK");
                
                // Unzip
                ZipArchive* za = [[ZipArchive alloc] init];
                
                if([za UnzipOpenFile:zipPath])
                {
                    NSString *dir = [[NSString alloc] init];
                    dir = [NSHomeDirectory() stringByAppendingPathComponent:@"tmp"];
                    NSString *filename = [NSString stringWithFormat:@"slide%d", rand()];
                    NSString *unzipPath = [dir stringByAppendingPathComponent:filename];
                    
                    NSLog(@"%@", unzipPath);
                    
                    BOOL ret = [za UnzipFileTo:unzipPath overWrite:YES];
                    
                    // Unzip Error
                    if(NO == ret) {
                        // エラー処理
                        NSLog(@"Unzip NG");

                    // Unzip Success
                    } else {
                        NSLog(@"Unzip OK");
                        
                        [[[UIAlertView alloc] initWithTitle:@"成功"
                                                    message:@"テンプレートをダウンロードしました"
                                                   delegate:nil
                                          cancelButtonTitle:nil
                                          otherButtonTitles:@"OK", nil] show];

                        templatePath = unzipPath;
                    }
                    
                    [za UnzipCloseFile];
                }
                
            // Save Error
            }else {
                NSLog(@"Download NG");
                
                [[[UIAlertView alloc] initWithTitle:@"エラー"
                                            message:@"保存に失敗しました"
                                           delegate:nil
                                  cancelButtonTitle:nil
                                  otherButtonTitles:@"OK", nil] show];
            }
        }
    }
}

/**
 * DLテンプレートで再生
 */
- (IBAction)buttonTemplatePlay:(id)sender {
    NSLog(@"buttonPlayDl");
    
    if (templatePath != nil) {
        SlideshowDlViewController *slide = [[SlideshowDlViewController alloc] initWithNibName:nil bundle:nil];
        slide.title = @"DL Template";
        [slide setImages: listImages];
        [slide setTemplate:templatePath];
        [self.navigationController pushViewController:slide animated:YES];
    }
}

/**
 * 一時ディレクトリをクリア
 */
- (IBAction)buttonClearDir:(id)sender {
    NSString *dir = [NSHomeDirectory() stringByAppendingPathComponent:@"tmp"];
    NSFileManager *fm = [NSFileManager defaultManager];
    NSDirectoryEnumerator *dirEnum = [fm enumeratorAtPath:dir];
    
    NSString *fname;
    while (fname = [dirEnum nextObject])
    {
        NSString *path = [dir stringByAppendingPathComponent:fname];
        NSLog(@"%@", path);
        [fm removeItemAtPath:path error:NULL];
    }
    
    templatePath = nil;
}

@end
