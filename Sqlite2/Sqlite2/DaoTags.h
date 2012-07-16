//
//  DaoTag.h
//  Sqlite2
//
//  Created by 飯田 亘 on 12/07/16.
//  Copyright (c) 2012年 Tangit Corp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dao.h"
#import "Tag.h"

@interface DaoTags : NSObject

- (Tag*)add:(Tag*)tag;
- (NSArray *)tags;
- (BOOL)update:(Tag*)tag;
- (BOOL)remove:(NSInteger)tagId;

@end
