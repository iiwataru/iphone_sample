//
//  TouchView.h
//  TouchCallback
//
//  Created by 飯田 亘 on 12/07/12.
//  Copyright (c) 2012年 Tangit Corp. All rights reserved.
//

#import <UIKit/UIKit.h>

id caller;
SEL callback;

@interface TouchView : UIView

- (void)setCallback:(id)cl cb:(SEL)cb;
- (void)setNumber:(NSInteger)i;

@end
