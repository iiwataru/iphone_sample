//
//  ViewController.h
//  PickerView
//
//  Created by 飯田 亘 on 12/07/11.
//  Copyright (c) 2012年 Tangit Corp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UIPickerView *picker;
@property (weak, nonatomic) IBOutlet UILabel *label;
- (IBAction)buttonPicker:(id)sender;

@end
