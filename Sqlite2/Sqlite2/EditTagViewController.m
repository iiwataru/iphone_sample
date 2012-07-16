//
//  EditTagViewController.m
//  Sqlite2
//
//  Created by 飯田 亘 on 12/07/16.
//  Copyright (c) 2012年 Tangit Corp. All rights reserved.
//

#import "EditTagViewController.h"

@interface EditTagViewController ()

@end

@implementation EditTagViewController
@synthesize _titleTextField;
@synthesize delegate, tag;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
	// 完了ボタン
    UIBarButtonItem* doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector( done: )];
    self.navigationItem.rightBarButtonItem = doneButton;
    
	if( self.tag )
	{
		_titleTextField.text      = self.tag.title;
	}
	else
	{
        // キャンセル ボタン
        UIBarButtonItem* cancelButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector( cancel: )];
        self.navigationItem.leftBarButtonItem = cancelButton;
    }
}

- (void)viewDidUnload
{
    [self set_titleTextField:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

/**
 * 完了ボタンが押された時に発生します。
 *
 * @param sender 送信者データ。
 */
- (void)done:(id)sender
{
	Tag* newTag = [[Tag alloc] init];
	newTag.tagId    = self.tag.tagId;
	newTag.title     = _titleTextField.text;
    
	if( self.tag )
	{
		[self.delegate editTagDidFinish:self.tag newTag:newTag];
	}
	else
	{
		[self.delegate addTagDidFinish:newTag];
	}
}

/**
 * キャンセル ボタンが押された時に発生します。
 *
 * @param sender 送信者データ。
 */
- (void)cancel:(id)sender
{	
	[self.delegate addTagDidFinish:nil];
}

@end
