//
//  ViewController.h
//  Sqlite2
//
//  Created by 飯田 亘 on 12/07/16.
//  Copyright (c) 2012年 Tangit Corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EditTagViewController.h"
#import "DaoTags.h"

@interface MainViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, EditTagDelegate>

@property (nonatomic, strong) DaoTags*             daoTags; //! タグのDAO
@property (nonatomic, strong) NSMutableArray*      tags;    //! タグコレクション

@property (weak, nonatomic) IBOutlet UITableView*  table;
@end
