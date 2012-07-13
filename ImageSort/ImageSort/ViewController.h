//
//  ViewController.h
//  ImageSort
//
//  Created by Tsutomu Ohta on 12/07/12.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

NSInteger image_count = 0;
NSMutableArray *image_list;

@interface ViewController : UIViewController
- (IBAction)sortImage:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *testImage;
@end
