//
//  PasswordDetailsViewController.h
//  Password Exploder
//
//  Created by Samuel Borowsky on 6/16/15.
//  Copyright (c) 2015 LookFar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PasswordDetailsViewController : UIViewController

@property NSString *access_code; //password access code sent down by API
@property NSMutableDictionary *replyDict; //

@property IBOutlet UIButton *home_btn; //controls the go home button

@property IBOutlet UITextView *details_tview; //controls the text view that displays the password details


@property NSMutableDictionary *password_details; //dictionary of password details sent from AccessPasswordViewController

@property UITextView *explode_txtview; //text view for message that appears when password explodes

@property UIButton *explodePassword; //the manually explode password button

@property UILabel *password_label; //the label for the password
@property UILabel *username_label; //the label for the "username" text
@property UILabel *username_txt_label; //the label for the username value
@property UILabel *notes_label; //the label for the "notes" text
@property UITextView *notes_txt_view; //the text view for the additional notes
@property UILabel *views_beg_label; //the label for the "this password has been viewed" text
@property UILabel *views_txt_label; //the label for the total views value
@property UILabel *expiration_label; //the label for the "this password explodes..." text
@property UILabel *expiration_txt_label; //the label for the expiration value

@property NSString *password_str; //controls the password string
@property NSString *username_str; //controls the username string
@property NSString *notes_str; //controls the notes string
@property NSString *expiration_str; //controls the expiration time
@property NSString *num_views_str; //controls the number of views string
@end
