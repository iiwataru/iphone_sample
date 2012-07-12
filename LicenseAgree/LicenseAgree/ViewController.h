//
//  ViewController.h
//  LicenseAgree
//
//  Created by 飯田 亘 on 12/07/12.
//  Copyright (c) 2012年 Tangit Corp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *viewLicense;

- (IBAction)buttonClear:(id)sender;
- (IBAction)buttonAgree:(id)sender;
- (IBAction)buttonDisagree:(id)sender;

@end
