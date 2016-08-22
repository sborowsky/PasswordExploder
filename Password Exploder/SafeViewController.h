//
//  SafeViewController.h
//  Password Exploder
//
//  Created by Samuel Borowsky on 6/9/15.
//  Copyright (c) 2015 LookFar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SafeViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *back_home_btn; //controls the return home button

@property (weak, nonatomic) IBOutlet UITextView *textView1;
@property (weak, nonatomic) IBOutlet UITextView *textView2;
@property (weak, nonatomic) IBOutlet UITextView *textView3;

@end
