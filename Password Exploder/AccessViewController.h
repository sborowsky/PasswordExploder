//
//  AccessViewController.h
//  Password Exploder
//
//  Created by Samuel Borowsky on 6/9/15.
//  Copyright (c) 2015 LookFar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AccessViewController : UIViewController

@property (nonatomic, retain) NSMutableDictionary *replyDict; //the password details pushed down from the API
@property (nonatomic, weak) IBOutlet UIImageView *badCodeImage; //controls the image that appears when an invalid access code is submitted

@property (weak, nonatomic) IBOutlet UITextField *code_field; //controls the "code" text field
@property (weak, nonatomic) IBOutlet UIButton *submit_btn; //controls the "view password" button
@property (weak, nonatomic) IBOutlet UIButton *home_btn; //controls the "go home" button


@end
