//
//  Dao.m
//  Sqlite2
//
//  Created by 飯田 亘 on 12/07/16.
//  Copyright (c) 2012年 Tangit Corp. All rights reserved.
//

#import "Dao.h"

#define DB_FILE_NAME @"app.db"

@implementation Dao

static Dao* sharedDao = nil;

@synthesize dbPath;


/**
 * Daoオブジェクトを取得します。(シングルトン)
 *
 * @return Daoオブジェクト。
 */
+ (Dao*)sharedInstance
{
    @synchronized(self) {
        if (sharedDao == nil)
        {
            sharedDao = [[self alloc] init];
        }
    }
    return sharedDao;
}

/**
 * データベースを取得します。
 *
 * @return データベース。
 */
- (FMDatabase*)getConnection
{
	if( self.dbPath == nil )
    {
		self.dbPath =  [self getDbFilePath];
	}
    
	return [FMDatabase databaseWithPath:self.dbPath];
}

/**
 * データベース ファイルのパスを取得します。
 */
- (NSString*)getDbFilePath
{
	NSArray*  paths = NSSearchPathForDirectoriesInDomains( NSDocumentDirectory, NSUserDomainMask, YES );
	NSString* dir   = [paths objectAtIndex:0];
	
	return [dir stringByAppendingPathComponent:DB_FILE_NAME];
}

@end
