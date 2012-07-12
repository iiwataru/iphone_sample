//
//  UserDefaults.h
//  UserDefaults
//
//  Created by 飯田 亘 on 12/07/11.
//  Copyright (c) 2012年 Tangit Corp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserDefaults : NSObject

+ (void)set:(NSString *)key value:(NSString *)value;
+ (NSString *)get:(NSString *)key;
+ (void)clear;

@end
