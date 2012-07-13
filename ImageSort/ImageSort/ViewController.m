//
//  ViewController.m
//  ImageSort
//
//  Created by Tsutomu Ohta on 12/07/12.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "TouchUIImageView.h"

@interface ViewController ()
@end

@implementation ViewController
@synthesize testImage;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    image_list = [NSMutableArray array];
    
    // image_view1~6を設定する
    TouchUIImageView *image_view1 = [[TouchUIImageView alloc] initWithImage:[UIImage imageNamed:@"hana_asagao.jpeg"]];
    image_view1.frame = CGRectMake(10, 10, 80, 80);
    image_view1.userInteractionEnabled = YES;
    image_view1.tag = 1;
    [image_view1 setCallback:self cb:@selector(catchCallback:)];
    TouchUIImageView *image_view2 = [[TouchUIImageView alloc] initWithImage:[UIImage imageNamed:@"hana_himawari_ippai.jpeg"]];
    image_view2.frame = CGRectMake(100, 10, 80, 80);
    image_view2.userInteractionEnabled = YES;
    image_view2.tag = 2;
    [image_view2 setCallback:self cb:@selector(catchCallback:)];
    TouchUIImageView *image_view3 = [[TouchUIImageView alloc] initWithImage:[UIImage imageNamed:@"hana_himawari.jpeg"]];
    image_view3.frame = CGRectMake(190, 10, 80, 80);
    image_view3.userInteractionEnabled = YES;
    image_view3.tag = 3;
    [image_view3 setCallback:self cb:@selector(catchCallback:)];
    TouchUIImageView *image_view4 = [[TouchUIImageView alloc] initWithImage:[UIImage imageNamed:@"yasai_aiko_kiiro.jpeg"]];
    image_view4.frame = CGRectMake(10, 100, 80, 80);
    image_view4.userInteractionEnabled = YES;
    image_view4.tag = 4;
    [image_view4 setCallback:self cb:@selector(catchCallback:)];
    TouchUIImageView *image_view5 = [[TouchUIImageView alloc] initWithImage:[UIImage imageNamed:@"yasai_hatukadaikon.jpeg"]];
    image_view5.frame = CGRectMake(100, 100, 80, 80);
    image_view5.userInteractionEnabled = YES;
    image_view5.tag = 5;
    [image_view5 setCallback:self cb:@selector(catchCallback:)];
    TouchUIImageView *image_view6 = [[TouchUIImageView alloc] initWithImage:[UIImage imageNamed:@"yasai_jagaimo.jpeg"]];
    image_view6.frame = CGRectMake(190, 100, 80, 80);
    image_view6.userInteractionEnabled = YES;
    image_view6.tag = 6;
    [image_view6 setCallback:self cb:@selector(catchCallback:)];
    
    // image_view1~6を表示する
    [self.view addSubview:image_view1];
    [self.view addSubview:image_view2];
    [self.view addSubview:image_view3];
    [self.view addSubview:image_view4];
    [self.view addSubview:image_view5];
    [self.view addSubview:image_view6];
}

- (void)viewDidUnload
{
    [self setTestImage:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (int)catchCallback:(TouchUIImageView *)view// isSelected:(BOOL)isSelected 
{
    testImage.image = view.image;
    //if (isSelected) {
        [image_list addObject:view.image];
        image_count++;
        NSLog(@"コールバック成功したよ！");
        return image_count;
    //} else {
        // TODO 選択取り消し処理
        //return -1;
    //}
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)sortImage:(id)sender {
    //TouchUIImageView *view1 = (TouchUIImageView *)[self.view.subviews objectAtIndex:0];
    TouchUIImageView *view1 = (TouchUIImageView *)[self.view viewWithTag:1];
    view1.image = [image_list objectAtIndex:0];
    //TouchUIImageView *view2 = (TouchUIImageView *)[self.view.subviews objectAtIndex:1];
    TouchUIImageView *view2 = (TouchUIImageView *)[self.view viewWithTag:2];
    view2.image = [image_list objectAtIndex:1];
    //TouchUIImageView *view3 = (TouchUIImageView *)[self.view.subviews objectAtIndex:2];
    TouchUIImageView *view3 = (TouchUIImageView *)[self.view viewWithTag:3];
    view3.image = [image_list objectAtIndex:2];
    //TouchUIImageView *view4 = (TouchUIImageView *)[self.view.subviews objectAtIndex:3];
    TouchUIImageView *view4 = (TouchUIImageView *)[self.view viewWithTag:4];
    view4.image = [image_list objectAtIndex:3];
    //TouchUIImageView *view5 = (TouchUIImageView *)[self.view.subviews objectAtIndex:4];
    TouchUIImageView *view5 = (TouchUIImageView *)[self.view viewWithTag:5];
    view5.image = [image_list objectAtIndex:4];
    //TouchUIImageView *view6 = (TouchUIImageView *)[self.view.subviews objectAtIndex:5];
    TouchUIImageView *view6 = (TouchUIImageView *)[self.view viewWithTag:6];
    view6.image = [image_list objectAtIndex:5];
}
@end
