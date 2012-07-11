//
//  ViewController.m
//  PickerView
//
//  Created by 飯田 亘 on 12/07/11.
//  Copyright (c) 2012年 Tangit Corp. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize picker;
@synthesize label;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    picker.delegate=self;    //デリゲートを自分自身に設定
}

- (void)viewDidUnload
{
    [self setPicker:nil];
    [self setLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)buttonPicker:(id)sender {
}


// デリゲートメソッドの実装
// 列数を返す例
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2; //列数は２つ
}

// 行数を返す例
- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component {

    if(component == 0){
        return 10;  // 1列目は10行
    }else{
        return 5;  // 2列目は5行
    }

}

// 表示する内容を返す例
- (NSString*)pickerView:(UIPickerView *)pickerView
            titleForRow:(NSInteger)row 
           forComponent:(NSInteger)component {

    // 行インデックス番号を返す
    return [NSString stringWithFormat:@"%d", row];

}

//選択されているindexを受け取って、ラベルに表示する
- (void) pickerView: (UIPickerView*)pView
       didSelectRow:(NSInteger)row
        inComponent:(NSInteger)component {
    NSLog(@"%d - %d", row, component);
    
    int row1;
    int row2;
    
    row1 = [picker selectedRowInComponent:0];  //0列目が選択されているindex
    row2 = [picker selectedRowInComponent:1];  //1列目が選択されているindex
    
    label.text=[NSString stringWithFormat:@"%d - %d",row1,row2];
}


@end
