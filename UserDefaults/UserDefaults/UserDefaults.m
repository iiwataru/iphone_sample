//
//  UserDefaults.m
//  UserDefaults
//
//  Created by 飯田 亘 on 12/07/11.
//  Copyright (c) 2012年 Tangit Corp. All rights reserved.
//

#import "UserDefaults.h"

static NSArray *keys = nil;

@implementation UserDefaults

/**
 * 初期化
 */
+ (void)initialize
{
    if (keys == nil) {
        // キー一覧
        keys = [NSArray arrayWithObjects:
                @"USER_ID",
                @"LICENSE_AGREED",
                nil];
        
        // 初期化処理
        NSMutableDictionary *appDefaults = [[NSMutableDictionary alloc] init];
        NSString *key;
        for (key in keys) {
            [appDefaults setObject:@"" forKey:key];
        }
        NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
        [def registerDefaults:appDefaults];
    }
}

/**
 * キーに値をセット
 */
+ (void)set:(NSString *)key value:(NSString *)value
{
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    if ([keys containsObject:key]) {
        [def setObject:value forKey:key];
    }
    [def synchronize];
}

/**
 * キーの値を取得
 */
+ (NSString *)get:(NSString *)key
{
    NSString *ret = @"";
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    if ([keys containsObject:key]) {
        ret = [def stringForKey:key];
    }
    return ret;
}

/**
 * クリア
 */
+ (void)clear
{
    NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
    [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];    
}

@end
