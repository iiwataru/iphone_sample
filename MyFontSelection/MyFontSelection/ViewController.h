//
//  ViewController.h
//  MyFontSelection
//
//  Created by 飯田 亘 on 12/07/03.
//  Copyright (c) 2012年 Tangit Corp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *tf;
@property (weak, nonatomic) IBOutlet UILabel *labelAnzu;

- (IBAction)buttonAnzu:(id)sender;
- (IBAction)buttonSystem:(id)sender;
- (IBAction)buttonAppleGothic:(id)sender;
- (IBAction)buttonCourier:(id)sender;

@end
