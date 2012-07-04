//
//  SubViewController.h
//  ParamSend
//
//  Created by Tsutomu Ohta on 12/07/04.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SubViewController : UIViewController
@property (copy, nonatomic) NSString *massage;
@property (retain, nonatomic) IBOutlet UILabel *lblMassage;
@end
