//
//  ViewController.m
//  GallaryJS
//
//  Created by Tsutomu Ohta on 12/07/17.
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
    [self setWebview:nil];
    [self setImageview:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)getImage:(id)sender {
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        UIImagePickerController *ipc = [[UIImagePickerController alloc] init];
        [ipc setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
        [ipc setDelegate:self];
        [ipc setAllowsEditing:YES];
        [self presentModalViewController:ipc animated:YES];
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    [imageview setImage:image];
    [self dismissModalViewControllerAnimated:YES];
    
    NSData *imageData = [[NSData alloc] init];
    imageData = UIImageJPEGRepresentation(image, 1.0f);
    
    NSString *document_path = [[NSString alloc] init];
    document_path = [NSHomeDirectory() stringByAppendingPathComponent:@"tmp"];
    NSString *path = [[NSString alloc] init];
    path = [NSString stringWithFormat:@"%@/save_image.jpg", document_path];
    [imageData writeToFile:path atomically:YES];
}

- (IBAction)dispImage:(id)sender {
    NSString *document_path = [[NSString alloc] init];
    document_path = [NSHomeDirectory() stringByAppendingPathComponent:@"tmp"];
    NSString *path = [[NSString alloc] init];
    path = [NSString stringWithFormat:@"%@/save_image.jpg", document_path];
    
    NSString *jsstr = [NSString stringWithFormat:@"dispImage('%@');", path];
    [webview stringByEvaluatingJavaScriptFromString:jsstr];
}
@end
