//
//  ViewController.m
//  Sqlite2
//
//  Created by 飯田 亘 on 12/07/16.
//  Copyright (c) 2012年 Tangit Corp. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController
@synthesize table;

@synthesize daoTags, tags;

/**
 * View が読み込まれた時に発生します
 */
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // デリゲート設定
    table.delegate = self;
    table.dataSource = self;
    
	self.daoTags = [[DaoTags alloc] init];
	self.tags  = [[NSMutableArray alloc] initWithCapacity:0];
	
	NSArray* existTags = [self.daoTags tags];
    for( Tag* tag in existTags )
    {
        [self addNewTag:tag];
    }

    // 追加ボタン
    UIBarButtonItem* addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector( addTag: )];
    self.navigationItem.rightBarButtonItem = addButton;

}

/**
 * View が破棄された時に発生します
 */
- (void)viewDidUnload
{
//    [table setTableView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

/**
 * 実機が回転された時に発生します
 */
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


#pragma mark - UITableViewController methods

/**
 * テーブルのセクション数を取得します。
 *
 * @param tableView テーブル。
 *
 * @return セクション数。
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

/**
 * テーブルの指定セクションにおける行数を取得します。
 *
 * @param tableView テーブル。
 * @param section   セクション。
 *
 * @return 行数。
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [self.tags count];
}

/**
 * セクションのタイトルを取得します。
 *
 * @param tableView テーブル。
 * @param section   セクション。
 *
 * @return タイトル。
 */
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
	return @"tags";
}

/**
 * 指定位置のセルを取得します。
 *
 * @param tableView テーブル。
 * @param indexPath 位置。
 *
 * @return セル。
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString* CellIdentifier = @"Cell";
    
	UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if( cell == nil )
	{
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
		cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	}
	
	Tag* tag = [self tagAtIndexPath:indexPath];
    NSLog(@"%d, %@", tag.tagId, tag.title);
	cell.textLabel.text = tag.title;
	
	return cell;
}

/**
 * セルが選択された時に発生します。
 *
 * @param tableView テーブル。
 * @param indexPath 位置。
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"EditTagStoryboard" bundle:nil];
    EditTagViewController *editor = [storyboard instantiateViewControllerWithIdentifier:@"EditTagView"];
	editor.delegate = self;
	editor.tag      = [self tagAtIndexPath:indexPath];

	[self.navigationController pushViewController:editor animated:YES];
}

/**
 * テーブルの編集を反映させる時に発生します。
 *
 * @param tableView    テーブル。
 * @param editingStyle 編集方法。
 * @param indexPath    編集個所。
 */
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
	if( editingStyle == UITableViewCellEditingStyleDelete )
	{
		[self removeTag:indexPath];
	}
}


#pragma mark - Action methods

/**
 * タグの追加ボタンが押された時に発生します。
 *
 * @param sender 送信者データ。
 */
- (void)addTag:(id)sender
{
    // ストーリボードからView生成
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"EditTagStoryboard" bundle:nil];
    EditTagViewController *editor = [storyboard instantiateViewControllerWithIdentifier:@"EditTagView"];
	editor.delegate = self;
	editor.title    = NSLocalizedString( @"TAG_EDIT_NEW_TITLE", nil );
	
	UINavigationController* navi = [[UINavigationController alloc] initWithRootViewController:editor];
	[self.navigationController presentModalViewController:navi animated:YES];
}

/**
 * 新しいタグを追加します。
 *
 * @param newTag タグ。
 */
- (void)addNewTag:(Tag*)newTag
{
    [self.tags addObject:newTag];
}

/**
 * 指定された位置のタグを取得します。
 *
 * @param indexPath 位置。
 *
 * @return タグ。
 */
- (Tag*)tagAtIndexPath:(NSIndexPath*)indexPath
{
    NSLog(@"%d, %d", [tags count], indexPath.row);
	return [tags objectAtIndex:indexPath.row];
}

/**
 * 指定された位置のタグを削除します。
 *
 * @param indexPath 位置。
 */
- (void)removeTag:(NSIndexPath*)indexPath
{
	Tag* tag = [self.tags objectAtIndex:indexPath.row];
	[self.daoTags remove:tag.tagId];
    [self removeOldTag:tag];
    [table deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];	
    [table endUpdates];
}

/**
 * 古いタグを削除します。
 *
 * @param oldTag タグ。
 */
- (void)removeOldTag:(Tag*)oldTag
{
    [self.tags removeObject:oldTag];
}

#pragma mark - Delegate methods

/**
 * タグの追加が完了した時に発生します。
 *
 * @param newTag 追加されたタグ。キャンセルされた場合は nil。
 */
- (void)addTagDidFinish:(Tag*)newTag
{
	if( newTag )
	{
        [self addNewTag:newTag];
        [self.daoTags add:newTag];
        [table reloadData];
	}
	
	[self.navigationController dismissModalViewControllerAnimated:YES];
}

/**
 * タグの編集が完了した時に発生します。
 *
 * @param oldTag 編集前のタグ。
 * @param newTag 編集後のタグ。
 */
- (void)editTagDidFinish:(Tag *)oldTag newTag:(Tag *)newTag
{
    [self removeOldTag:oldTag];
    [self addNewTag:newTag];
    [self.daoTags update:newTag];
    
	[table reloadData];
	[self.navigationController popViewControllerAnimated:YES];
}

@end
