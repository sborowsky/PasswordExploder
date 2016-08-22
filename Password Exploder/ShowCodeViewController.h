//
//  GetCodeViewController.h
//  Password Exploder
//
//  Created by Samuel Borowsky on 6/16/15.
//  Copyright (c) 2015 LookFar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShowCodeViewController : UIViewController

@property (nonatomic, retain) NSString *code_value; //controls the value of the access code label

@property (weak, nonatomic) IBOutlet UITextField *access_code; //controls the access code text field

@property (weak, nonatomic) IBOutlet UIButton *home_btn; //controls the go home button

@end
