//
//  ViewController.m
//  JsonParse
//
//  Created by 飯田 亘 on 12/07/12.
//  Copyright (c) 2012年 Tangit Corp. All rights reserved.
//

#import "ViewController.h"

// 参考RUL
// http://d.hatena.ne.jp/hiroki83/20110122/1295671580
// https://github.com/stig/json-framework/downloads
#import "SBJson.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self parse];
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

- (void)parse
{
    // twitterからstatusesをダウンロードするためのURLリクエストを準備
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://twitter.com/statuses/public_timeline.json"]];
    
    // URLからJSONデータを取得(NSData)
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    // JSONで解析するために、NSDataをNSStringに変換。
    NSString *json_string = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
    NSLog(@"%@", json_string);
    
    // JSONデータをパースする。
    // ここではJSONデータが配列としてパースされるので、NSArray型でデータ取得
    NSArray *statuses = [json_string JSONValue];
    
    // statuses内の要素を取り出して、確認
    for (NSDictionary *status in statuses)
    {
        // You can retrieve individual values using objectForKey on the status NSDictionary
        // This will print the tweet and username to the console
        NSLog(@"%@ - %@", [status objectForKey:@"text"], [[status objectForKey:@"user"] objectForKey:@"screen_name"]);
    }
}

@end
