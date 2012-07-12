//
//  ViewController.h
//  ImageSelection
//
//  Created by Tsutomu Ohta on 12/07/12.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TouchUIImageVIew.h"

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet TouchUIImageVIew *selectImage1;
@property (weak, nonatomic) IBOutlet TouchUIImageVIew *selectImage2;
@property (weak, nonatomic) IBOutlet TouchUIImageVIew *selectImage3;
@property (weak, nonatomic) IBOutlet TouchUIImageVIew *selectImage4;
@property (weak, nonatomic) IBOutlet TouchUIImageVIew *selectImage5;
@property (weak, nonatomic) IBOutlet TouchUIImageVIew *selectImage6;
@property (weak, nonatomic) IBOutlet UIImageView *testview;
@end
