//
//  ViewController.h
//  ButtonDisable
//
//  Created by 飯田 亘 on 12/07/11.
//  Copyright (c) 2012年 Tangit Corp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

- (IBAction)buttonEnable:(id)sender;
- (IBAction)buttonDisable:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *buttonTarget;
@end
