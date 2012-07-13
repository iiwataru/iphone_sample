//
//  TouchUIImageView.h
//  ImageSort
//
//  Created by Tsutomu Ohta on 12/07/12.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

id caller;
SEL callback;
int retNum;
BOOL isSelected;

@interface TouchUIImageView : UIImageView
- (void)setCallback:(id)cl cb:(SEL)cb;
@end
