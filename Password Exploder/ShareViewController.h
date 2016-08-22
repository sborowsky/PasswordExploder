//
//  ShareViewController.h
//  Password Exploder
//
//  Created by Samuel Borowsky on 6/9/15.
//  Copyright (c) 2015 LookFar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AddressBookUI/AddressBookUI.h>
#import <MessageUI/MessageUI.h>
#import "GetCodeViewController.h"

@interface ShareViewController : UIViewController <ABPeoplePickerNavigationControllerDelegate, MFMessageComposeViewControllerDelegate>;

@property (nonatomic, retain) NSString *password_code; //controls the auto generated password ID
@property (nonatomic, retain) NSMutableDictionary *passwordDict; //controls the relevant password info
@property (weak, nonatomic) IBOutlet UIView *dateView; //controls the view for the date picker
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker; //controls the date picker
@property (nonatomic, retain) UIAlertView *errorMessageDate; //controls error message for bad date chosen by user
@property (nonatomic, retain) UIAlertView *errorMessageSubmission; //controls error message for a bad password submission

@property (nonatomic, assign) NSInteger expirationValue; //manages the password expiration time
@property (nonatomic, retain) NSMutableString *phoneNums; //manages the selected contacts

@property (weak, nonatomic) IBOutlet UITextField *password; //controls the password field
@property (weak, nonatomic) IBOutlet UITextField *username; //controls the username field
@property (weak, nonatomic) IBOutlet UITextView *info; //controls the additional info field

@property (weak, nonatomic) IBOutlet UITextView *contacts; //controls the phone numbers field
@property (weak, nonatomic) IBOutlet UITextView *emails; //controls the emails field
@property (weak, nonatomic) IBOutlet UITextView *ip_addresses; //controls the IP addresses field
@property (weak, nonatomic) IBOutlet UITextView *max_views; //controls the max views field

@property (weak, nonatomic) IBOutlet UIButton *hour_btn; //controls the "hour" button
@property (weak, nonatomic) IBOutlet UIButton *day_btn; //controls the "day" button
@property (weak, nonatomic) IBOutlet UIButton *week_btn; //controls the "week" button
@property (weak, nonatomic) IBOutlet UIButton *custom_btn; //controls the "custom" button
@property (weak, nonatomic) IBOutlet UIButton *random_btn; //controls the "random password" button
@property (weak, nonatomic) IBOutlet UIButton *add_contact_btn; //controls the "add contact" button
@property (weak, nonatomic) IBOutlet UIButton *plus_view_btn; //controls the "increment views" button
@property (weak, nonatomic) IBOutlet UIButton *minus_view_btn; //controls the "decrement views" button
@property (weak, nonatomic) IBOutlet UIButton *infinity_btn; //controls the "set infinity" button
@property (weak, nonatomic) IBOutlet UIButton *submit_btn; //controls the "create exploding password" button
@property (weak, nonatomic) IBOutlet UIButton *home_btn; //controls the "go home" button

@end

