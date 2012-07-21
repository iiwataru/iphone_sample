//
//  ViewController.m
//  ZipArchive
//
//  Created by 飯田 亘 on 12/07/21.
//  Copyright (c) 2012年 Tangit Corp. All rights reserved.
//

#import "ViewController.h"
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

- (IBAction)buttonDl:(id)sender {
    
    // DL
    NSURL *url = [NSURL URLWithString:@"https://dl.dropbox.com/u/717602/test/pic/jsslide1_copy.zip"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLResponse *response = nil;
    NSError *error = nil;
    NSData *data = [NSURLConnection sendSynchronousRequest : request
                                         returningResponse : &response
                                                     error : &error
                    ];
    
    // DL error
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
    }
    
    // 保存
    NSString *dir = [[NSString alloc] init];
    dir = [NSHomeDirectory() stringByAppendingPathComponent:@"tmp"];
    NSString *filename = [NSString stringWithFormat:@"zip%d.zip", rand()];
    zipPath = [dir stringByAppendingPathComponent:filename];
    
    NSLog(@"%@",zipPath);
    
    BOOL success = NO;
    success = [data writeToFile:zipPath atomically:YES];
    
    if (success) {
        NSLog(@"Download OK");
    }else {
        NSLog(@"Download NG");
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"エラー"
                                                        message:@"保存に失敗しました"
                                                       delegate:nil
                                              cancelButtonTitle:nil
                                              otherButtonTitles:@"OK", nil];
        [alert show];
    }
}

- (IBAction)buttonUnzip:(id)sender {
    
    if (zipPath == nil) {
        return;
    }
    
    ZipArchive* za = [[ZipArchive alloc] init];
    
    if([za UnzipOpenFile:zipPath])
    {
        NSString *dir = [[NSString alloc] init];
        dir = [NSHomeDirectory() stringByAppendingPathComponent:@"tmp"];
        NSString *filename = [NSString stringWithFormat:@"slide%d", rand()];
        unzipPath = [dir stringByAppendingPathComponent:filename];
        
        NSLog(@"%@", unzipPath);

        BOOL ret = [za UnzipFileTo:unzipPath overWrite:YES];
        if(NO == ret) {
            // エラー処理
            NSLog(@"Unzip NG");
        } else {
            NSLog(@"Unzip OK");
        }
        [za UnzipCloseFile];
        
    }
}

- (IBAction)buttonShowDir:(id)sender {

    NSString *dir = [NSHomeDirectory() stringByAppendingPathComponent:@"tmp"];
    NSLog(@"%@", dir);
    
    // http://azukisoft.blogspot.jp/2010/06/is-deprecated.html
    NSDirectoryEnumerator *dirEnum = [[NSFileManager defaultManager] enumeratorAtPath:dir];
    
    NSLog(@"--- Show Directory START ---");
    
    NSString *fname;
    while (fname = [dirEnum nextObject])
    {
        NSLog(@"%@", fname);
    }

    NSLog(@"--- Show Directory END ---");
    
}

@end
