//
//  ViewController.m
//  Sqlite
//
//  Created by 飯田 亘 on 12/07/05.
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
    
    
    // SQLite test
    // http://akabeko.me/blog/2011/11/ios-sqlite-fmdb/ ライブラリ追加
    // 
    NSFileManager *fileManager = [NSFileManager defaultManager];	
	NSError *error;
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	NSString *writableDBPath = [documentsDirectory stringByAppendingPathComponent:@"db.sqlite"];
	BOOL success = [fileManager fileExistsAtPath:writableDBPath];
	if(!success){ 
		NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"db.sqlite"];
		success = [fileManager copyItemAtPath:defaultDBPath toPath:writableDBPath error:&error];
	}
	if(!success){
		NSAssert1(0, @"failed to create writable db file with message '%@'.", [error localizedDescription]);
	}
    //ここまでがDBファイルのPathを取得する所、ここから下が実際にSqliteを操作する所
    
	FMDatabase* db = [FMDatabase databaseWithPath:writableDBPath];
    if (![db open]) {
        NSLog(@"Could not open db.");
//        return 0;
    }
    
    [db setShouldCacheStatements:YES];
    
    [db beginTransaction];
	[db executeUpdate:@"insert into images (id,title) values (?, ?)" ,
	 [NSNumber numberWithInt:rand()], //注１ 
	 @"test image"];
    [db commit];
    
	FMResultSet *rs = [db executeQuery:@"select * from images"];
    while ([rs next]) {
        NSLog(@"%d %@ ",
              [rs intForColumn:@"id"],
              [rs stringForColumn:@"title"]);
    }
    [rs close];
    [db close];
    
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

@end
