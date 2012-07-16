//
//  EditTagViewController.h
//  Sqlite2
//
//  Created by 飯田 亘 on 12/07/16.
//  Copyright (c) 2012年 Tangit Corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DaoTags.h"

////////////////////////////////////////////////////////////////////////////////
/**
 * タグの追加、または編集画面が完了したことを通知するデリゲートです。
 */
@protocol EditTagDelegate
- (void)addTagDidFinish:(Tag*)newTag;
- (void)editTagDidFinish:(Tag*)oldTag newTag:(Tag*)newTag;
@end

@interface EditTagViewController : UIViewController

@property (nonatomic, assign) id<EditTagDelegate> delegate; //! タグの追加、または編集画面が完了したことを通知するデリゲート
@property (nonatomic, strong) Tag*                tag;     //! 編集対象となるタグ
@property (weak, nonatomic) IBOutlet UITextField *_titleTextField;

@end
