//
//  Tag.h
//  Sqlite2
//
//  Created by 飯田 亘 on 12/07/16.
//  Copyright (c) 2012年 Tangit Corp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tag : NSObject

@property (nonatomic, assign) NSInteger tagId;     //! 識別子
@property (nonatomic, strong) NSString* title;     //! 題名

@end
