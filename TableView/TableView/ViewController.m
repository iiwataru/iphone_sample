//
//  ViewController.m
//  TableView
//
//  Created by 飯田 亘 on 12/07/13.
//  Copyright (c) 2012年 Tangit Corp. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize table;
@synthesize label;

NSMutableArray *listOfTags;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    // デリゲート設定
    table.delegate = self;
    table.dataSource = self;
    
    // タグ一覧
    listOfTags = [[NSMutableArray alloc] init];
    [listOfTags addObject:@"tag A"];
    [listOfTags addObject:@"tag B"];
    [listOfTags addObject:@"tag C"];
    [listOfTags addObject:@"tag D"];
    [listOfTags addObject:@"tag E"];
    [listOfTags addObject:@"tag F"];
    [listOfTags addObject:@"tag G"];
    [listOfTags addObject:@"tag H"];
    [listOfTags addObject:@"tag I"];
    [listOfTags addObject:@"tag J"];
    [listOfTags addObject:@"tag K"];
    [listOfTags addObject:@"tag L"];
    [listOfTags addObject:@"tag M"];
    [listOfTags addObject:@"tag N"];
    [listOfTags addObject:@"tag O"];
    [listOfTags addObject:@"tag P"];
    
    // タグ表示更新
    [self refreshTags];
}

- (void)viewDidUnload
{
    [self setTable:nil];
    [self setLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

/**
 * セルの数
 */
-(NSInteger)tableView:(UITableView *)tableView
numberOfRowsInSection:(NSInteger)section
{
    return [listOfTags count];
}

/**
 * セルの初期化
 */
-(UITableViewCell *)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView 
                             dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] 
                 initWithStyle:UITableViewCellStyleDefault 
                 reuseIdentifier:CellIdentifier];
    }
    
    NSString *cellValue = [listOfTags objectAtIndex:indexPath.row];
    cell.textLabel.text = cellValue;
    
    return cell;    
}

/**
 * ヘッダ
 */
- (NSString *)tableView:(UITableView *)tableView 
    titleForHeaderInSection:(NSInteger)section
{
    return @"Tags";
}

/**
 * セル選択時
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 選択状態の解除
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
	//選択されたセルを取得
	UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
	//セルにチェックが付いている場合はチェックを外し、付いていない場合はチェックを付ける
	if (cell.accessoryType == UITableViewCellAccessoryCheckmark)
	{
		cell.accessoryType = UITableViewCellAccessoryNone;
	}
	else
	{
		cell.accessoryType = UITableViewCellAccessoryCheckmark;
	}
    
    // タグ表示更新
    [self refreshTags];
}

/**
 * タグ表示更新
 */
- (void)refreshTags
{
    NSMutableArray *tags = [[NSMutableArray alloc] init];
    
    //１行目から順にセルを取得していく
    for (int i = 0; i < [listOfTags count]; i++) {
        NSIndexPath *index = [NSIndexPath indexPathForRow:i inSection:0];
        UITableViewCell *cell = [table cellForRowAtIndexPath:index];
        
        if (cell.accessoryType == UITableViewCellAccessoryCheckmark) {
            [tags addObject:cell.textLabel.text];
        }
    }
    
    // チェックされたタグを文字列に出力
    NSString *tagString = [NSString stringWithCString:"" encoding:NSUTF8StringEncoding];
    NSString *tag;
    for (tag in tags) {
        if (![tagString isEqualToString:@""]) {
            tagString = [NSString stringWithFormat:@"%@%@", tagString, @", "];
        }
        tagString = [NSString stringWithFormat:@"%@%@", tagString, tag];
    }
    
    // ラベルを更新
    label.text = tagString;
}

@end
