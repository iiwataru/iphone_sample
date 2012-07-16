//
//  DaoTag.m
//  Sqlite2
//
//  Created by 飯田 亘 on 12/07/16.
//  Copyright (c) 2012年 Tangit Corp. All rights reserved.
//

#import "DaoTags.h"

#define SQL_CREATE @"CREATE TABLE IF NOT EXISTS tags (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT);"
#define SQL_INSERT @"INSERT INTO tags (title) VALUES (?);"
#define SQL_UPDATE @"UPDATE tags SET title = ? WHERE id = ?;"
#define SQL_SELECT @"SELECT id, title FROM tags;"
#define SQL_DELETE @"DELETE FROM tags WHERE id = ?;"

@implementation DaoTags

/**
 * インスタンスを初期化します。
 *
 * @return 初期化後のインスタンス。
 */
- (id)init
{
	self = [super init];
	if( self )
	{
		FMDatabase* db = [[Dao sharedInstance] getConnection];
		[db open];
		[db executeUpdate:SQL_CREATE];
		[db close];
	}
    
	return self;
}

/**
 * タグを追加します。
 *
 * @param tag タグ。
 *
 * @return 成功時は識別子を割り当てられたタグ。失敗時は nil。
 */
- (Tag*)add:(Tag*)tag
{
	FMDatabase* db = [[Dao sharedInstance] getConnection];
	[db open];
    
	[db setShouldCacheStatements:YES];
	if( [db executeUpdate:SQL_INSERT, tag.title] )
	{
		tag.tagId = [db lastInsertRowId];
	}
	else
	{
		tag = nil;
	}
	
	[db close];
    
	return tag;
}

/**
 * タグコレクションを取得します。
 *
 * @return タグコレクション。
 */
- (NSArray *)tags
{
	FMDatabase* db = [[Dao sharedInstance] getConnection];
	[db open];
	
	FMResultSet*    results = [db executeQuery:SQL_SELECT];
	NSMutableArray* tags = [[NSMutableArray alloc] initWithCapacity:0];
	
	while( [results next] )
	{
		Tag* tag = [[Tag alloc] init];
		tag.tagId    = [results intForColumnIndex:0];
		tag.title    = [results stringForColumnIndex:1];
		
		[tags addObject:tag];
	}
	
	[db close];
	
	return tags;
}

/**
 * タグを削除します。
 *
 * @param bookId
 *
 * @return 成功時は YES。それ以外は NO。
 */
- (BOOL)remove:(NSInteger)tagId
{
	FMDatabase* db = [[Dao sharedInstance] getConnection];
	[db open];
    
	BOOL ret = [db executeUpdate:SQL_DELETE, [NSNumber numberWithInteger:tagId]];
	
	[db close];
    
	return ret;
}

/**
 * タグを更新します。
 */
- (BOOL)update:(Tag*)tag
{
	FMDatabase* db = [[Dao sharedInstance] getConnection];
	[db open];
	
	BOOL ret = [db executeUpdate:SQL_UPDATE, tag.title, [NSNumber numberWithInteger:tag.tagId]];
	
	[db close];
	
	return ret;
}

@end
