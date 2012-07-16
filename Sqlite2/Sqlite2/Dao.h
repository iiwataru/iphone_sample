//
//  Dao.h
//  Sqlite2
//
//  Created by 飯田 亘 on 12/07/16.
//  Copyright (c) 2012年 Tangit Corp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"
#import "FMResultSet.h"

@interface Dao : NSObject

@property (nonatomic, copy) NSString* dbPath; //! データベース　ファイルへのパス

+ (Dao*)sharedInstance;
- (FMDatabase*)getConnection;
- (NSString*)getDbFilePath;

@end
