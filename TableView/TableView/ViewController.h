//
//  ViewController.h
//  TableView
//
//  Created by 飯田 亘 on 12/07/13.
//  Copyright (c) 2012年 Tangit Corp. All rights reserved.
//

#import <UIKit/UIKit.h>

NSMutableArray* selectedTags;

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *table;
@property (weak, nonatomic) IBOutlet UILabel *label;
@end
