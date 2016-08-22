//
//  ShareViewController.m
//  Password Exploder
//
//  Created by Samuel Borowsky on 6/9/15.
//  Copyright (c) 2015 LookFar. All rights reserved.
//

#import "ShareViewController.h"
#import "ShowCodeViewController.h"
//#import "AAPL_8or7_PersonPickerViewController.h"
//#import <AddressBookUI/AddressBookUI.h>
@import AddressBook;
@import AddressBookUI;

@interface ShareViewController ()

@end

@implementation ShareViewController

@synthesize passwordDict, expirationValue, errorMessageDate, errorMessageSubmission, phoneNums, password_code;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //NSString *views_str = _max_views.text;
    //NSLog(views_str);
    
    // Do any additional setup after loading the view.
    
    //create header for view controller that says "Welcome"
        
    UIView *subview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 60)];
    subview.backgroundColor = [UIColor colorWithRed:(60/255.0) green:(60/255.0) blue:(60/255.0) alpha:1]; //set the background color of the title label to orange
    //subview.backgroundColor = [UIColor blackColor];
    
    UILabel *title_label = [[UILabel alloc] init];
    title_label.frame = CGRectMake(0, (subview.frame.size.height/2)-12, subview.frame.size.width, 45);
    title_label.textAlignment = NSTextAlignmentCenter;
    title_label.font = [UIFont fontWithName:@"Courier" size:36];
    title_label.textColor = [UIColor whiteColor];
    title_label.text = @"Share";
    
    UIButton *home_button = [[UIButton alloc] initWithFrame:CGRectMake(330, 15, 50, 50)];
    UIImageView *image_view = [[UIImageView alloc] initWithFrame:CGRectMake(310, 15, 50, 50)];
    image_view.alpha = .4;
    
    UIImage *home_image = [UIImage imageNamed:@"homeWhite1.png"];
    
    //[home_button setBackgroundColor:([UIColor whiteColor])];
    [home_button setImage:home_image forState:UIControlStateNormal];
    [home_button addTarget:self action:@selector(go_home:) forControlEvents:UIControlEventTouchUpInside];
    
    image_view.image = home_image;
    
    [home_button addSubview:image_view];
    [subview addSubview:title_label];
    [subview addSubview:home_button];
    [self.view addSubview:subview];
    
    [_contacts setTextColor:self.view.tintColor];
    
    // Hide the view for the date picker
    [_dateView setHidden:YES];
    
    
    //format the "hour" button
    _hour_btn.layer.shadowColor = [UIColor blackColor].CGColor;
    _hour_btn.layer.shadowOffset = CGSizeMake(5.0, 5.0);
    _hour_btn.layer.shadowOpacity = 0.65;
    _hour_btn.layer.shadowRadius = 2.0;
    //_hour_btn.backgroundColor = [UIColor darkGrayColor];
    //[[_hour_btn layer] setBorderWidth:2.0f];
    [self buttonClicked:_hour_btn];
    
    //format the "day" button
     _day_btn.layer.shadowColor = [UIColor blackColor].CGColor;
     _day_btn.layer.shadowOffset = CGSizeMake(5.0, 5.0);
     _day_btn.layer.shadowOpacity = 0.65;
     _day_btn.layer.shadowRadius = 2.0;
    // [[_day_btn layer] setBorderWidth:2.0f];
    // [[_day_btn layer] setBorderColor:[UIColor whiteColor].CGColor];

    
    //format the "week" button
     _week_btn.layer.shadowColor = [UIColor blackColor].CGColor;
     _week_btn.layer.shadowOffset = CGSizeMake(5.0, 5.0);
     _week_btn.layer.shadowOpacity = 0.65;
     _week_btn.layer.shadowRadius = 2.0;
    // [[_week_btn layer] setBorderWidth:2.0f];
    // [[_week_btn layer] setBorderColor:[UIColor whiteColor].CGColor];

    
    //format the "custom" button
     _custom_btn.layer.shadowColor = [UIColor blackColor].CGColor;
     _custom_btn.layer.shadowOffset = CGSizeMake(5.0, 5.0);
     _custom_btn.layer.shadowOpacity = 0.65;
     _custom_btn.layer.shadowRadius = 2.0;
    // [[_custom_btn layer] setBorderWidth:2.0f];
    // [[_custom_btn layer] setBorderColor:[UIColor whiteColor].CGColor];

    
    //format the "random" button
     _random_btn.layer.shadowColor = [UIColor blackColor].CGColor;
     _random_btn.layer.shadowOffset = CGSizeMake(4.0, 4.0);
     _random_btn.layer.shadowOpacity = 0.65;
     _random_btn.layer.shadowRadius = 2.0;
     //[[_random_btn layer] setBorderWidth:2.0f];
     //[[_random_btn layer] setBorderColor:[UIColor whiteColor].CGColor];

    
    //format the "add contact" button
     _add_contact_btn.layer.shadowColor = [UIColor blackColor].CGColor;
     _add_contact_btn.layer.shadowOffset = CGSizeMake(2.0, 2.0);
     _add_contact_btn.layer.shadowOpacity = 0.65;
     _add_contact_btn.layer.shadowRadius = 2.0;
     [[_add_contact_btn layer] setBorderWidth:2.0f];
     [[_add_contact_btn layer] setBorderColor:[UIColor whiteColor].CGColor];
    
    //format the "plus view" button
     _plus_view_btn.layer.shadowColor = [UIColor blackColor].CGColor;
     _plus_view_btn.layer.shadowOffset = CGSizeMake(5.0, 5.0);
     _plus_view_btn.layer.shadowOpacity = 0.65;
     _plus_view_btn.layer.shadowRadius = 2.0;
     //[[_plus_view_btn layer] setBorderWidth:2.0f];
     //[[_plus_view_btn layer] setBorderColor:[UIColor whiteColor].CGColor];
    
    //format the "minus view" button
     _minus_view_btn.layer.shadowColor = [UIColor blackColor].CGColor;
     _minus_view_btn.layer.shadowOffset = CGSizeMake(5.0, 5.0);
     _minus_view_btn.layer.shadowOpacity = 0.65;
     _minus_view_btn.layer.shadowRadius = 2.0;
     //[[_minus_view_btn layer] setBorderWidth:2.0f];
     //[[_minus_view_btn layer] setBorderColor:[UIColor whiteColor].CGColor];
    
    //format the "infinite views" button
    _infinity_btn.layer.shadowColor = [UIColor blackColor].CGColor;
    _infinity_btn.layer.shadowOffset = CGSizeMake(5.0, 5.0);
    _infinity_btn.layer.shadowOpacity = 0.65;
    _infinity_btn.layer.shadowRadius = 2.0;
    [[_infinity_btn layer] setBorderWidth:2.0f];
    [[_infinity_btn layer] setBorderColor:[UIColor whiteColor].CGColor];
    
    //format the "create password" button
     _submit_btn.layer.shadowColor = [UIColor blackColor].CGColor;
     _submit_btn.layer.shadowOffset = CGSizeMake(5.0, 5.0);
     _submit_btn.layer.shadowOpacity = 0.9;
     _submit_btn.layer.shadowRadius = 2.0;
     _submit_btn.backgroundColor = [UIColor colorWithRed:(248/255.0) green:(103/255.0) blue:(56/255.0) alpha:.9];
     [[_submit_btn layer] setBorderWidth:2.0f];
     [[_submit_btn layer] setBorderColor:[UIColor blackColor].CGColor];
    
    //format the "go home" button
    _home_btn.layer.shadowColor = [UIColor blackColor].CGColor;
    _home_btn.layer.shadowOffset = CGSizeMake(5.0, 5.0);
    _home_btn.layer.shadowOpacity = 0.9;
    _home_btn.layer.shadowRadius = 2.0;
    [[_home_btn layer] setBorderWidth:2.0f];
    [[_home_btn layer] setBorderColor:[UIColor blackColor].CGColor];
    
    //instantiate the password info dictionary
    self.passwordDict = [NSMutableDictionary dictionary];
    
    //instantiate the password ID
    self.password_code  = [[NSString alloc] init];
    
    //instantiate the password expiration value
    NSTimeInterval timeStamp = [[NSDate date] timeIntervalSince1970];
    NSInteger timestamp_int = (int)timeStamp;
    timestamp_int += 3600;
    self.expirationValue = timestamp_int;
    NSString *exp_str = [NSString stringWithFormat:@"%ld",(long)expirationValue];
    NSLog(@"expiration stamp= %@", exp_str);
    
    //instantiate the invalid date selection error message
    self.errorMessageDate = [[UIAlertView alloc] initWithTitle:@"Sorry"
                                                   message:@"You must select a future date."
                                                  delegate:self
                                         cancelButtonTitle:@"OK"
                                         otherButtonTitles:nil];
    //instantiate the bad password submission error message
    self.errorMessageSubmission = [[UIAlertView alloc] initWithTitle:@"Sorry"
                                                       message:@"Your submission must include a password and expiration time."
                                                      delegate:self
                                             cancelButtonTitle:@"OK"
                                             otherButtonTitles:nil];
    
    //instantiate the string of selected phone numbers
    self.phoneNums = [[NSMutableString alloc] init];
    //CGAffineTransform moveAlertUp = CGAffineTransformMakeTranslation(0.0, 200.0);
    //[errorMessage setTransform:moveAlertUp];
    
    //NSLog(@"password info viewdidload: =%@", submissionDict);
    
    
}


- (IBAction)clickRandom:(id)sender {
    [self randomPassword];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (IBAction)submitPassword:(id)sender {
    //get the password information
    NSString *max_views_inf;
    
    NSString *password_str = _password.text;
    NSString *expiration_str = [NSString stringWithFormat:@"%ld", (long)expirationValue];
    NSString *username_str = _username.text;
    NSString *info_str = _info.text;
    
    NSString *contacts_str = _contacts.text;
    NSArray *phoneNumbersArray = [contacts_str componentsSeparatedByString:@" "];
    
    NSString *emails_str = _emails.text;
    NSString *ip_str = _ip_addresses.text;
    NSString *max_views_str = _max_views.text;
    NSLog(@"max views: %@", max_views_str);
    NSLog(@"USERNAME: %@", username_str);
    NSLog([max_views_str isEqualToString:@"∞"] ? @"Yes" : @"No");
    
    
    //add the password information to the dictionary
    [passwordDict setObject:username_str forKey:@"user"];
    [passwordDict setObject:password_str forKey:@"password"];
    [passwordDict setObject:expiration_str forKey:@"expireDate"];
    //[passwordDict setObject:username_str forKey:@"username"];
    [passwordDict setObject:info_str forKey:@"note"];
    //[passwordDict setObject:contacts_str forKey:@"contacts"];
    [passwordDict setObject:emails_str forKey:@"notifications"];
    [passwordDict setObject:ip_str forKey:@"ip_restrictions"];
    [passwordDict setObject:max_views_str forKey:@"viewLimit"];
    
    if ([max_views_str isEqualToString:@"∞"]){
        max_views_inf = @"0";
        [passwordDict setObject:@"0" forKey:@"viewLimit"];
    }
    NSLog(@"max views inf: %@", max_views_inf);
    NSLog(@"dictionary before: %@", passwordDict);////
    
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:passwordDict
                                                       options:0
                                                         error:&error];
    
    NSLog(@"JSON data before: %@", jsonData);////
   // NSLog(@"json obj= %@", jsonData);
    
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:0];
    
    if (! jsonData) {
        NSLog(@"Got an error: %@", error);
        return;
    } else {
        NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:0];
    }
    
    NSLog(@"json str= %@", jsonString);
    
    NSData *postData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:@"https://passwordexploder.com/api/passwords/"]];
    [request setHTTPMethod:@"POST"];
    
    [request setHTTPBody:jsonData];
    
    NSURLResponse *requestResponse;
    NSData *requestHandler = [NSURLConnection sendSynchronousRequest:request returningResponse:&requestResponse error:nil];
    
   // NSString *requestReply = [[NSString alloc] initWithBytes:[requestHandler bytes] length:[requestHandler length] encoding:NSASCIIStringEncoding];
    
    NSError *error2;
    NSMutableDictionary *replyDict = [NSJSONSerialization
                                       JSONObjectWithData:requestHandler
                                       options:NSJSONReadingMutableContainers
                                       error:&error2];
    if ([replyDict count] == 1){
        NSLog(@"bad submission");
        [errorMessageSubmission show];
        return;
    }
    
    NSLog(@"response: %@", replyDict);
    
    /////////////////// parsing the server response /////////////////////////
    NSLog(@"access code: %@", [replyDict objectForKey:@"id"]);
    NSLog(@"reply dict size: %lu", (unsigned long)[replyDict count]);
    NSLog(@"error2: %@", error2);
    password_code = [replyDict objectForKey:@"id"];
    
    //[self performSegueWithIdentifier:@"get_access_code" sender:sender];
   //UIStoryboardSegue *get_access_code;
    
    //call the function that sends text message notification with the access code to the specified recipients
    [self sendText:phoneNumbersArray : password_code];
    
    [self performSegueWithIdentifier:@"get_access_code" sender:self];
    
    //NSLog(@"dictionary end: %@", passwordDict);

}

- (void)sendText:(NSArray *)phoneNumbersList :(NSString *)accessCode {
    [self sendSMS:[NSString stringWithFormat:@"Someone has used Password Exploder to share a password with you. The mobile access code to view the password is %@", accessCode] : phoneNumbersList];
}


- (void)sendSMS:(NSString *)bodyOfMessage : (NSArray *)recipients
{
    MFMessageComposeViewController *controller = [[MFMessageComposeViewController alloc] init];
    if([MFMessageComposeViewController canSendText])
    {
        controller.body = bodyOfMessage;
        controller.recipients = recipients;
        controller.messageComposeDelegate = self;
        //[self presentModalViewController:controller animated:YES];
        [self presentViewController:controller animated:YES completion:nil];
    }
}

- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
    if (result == MessageComposeResultCancelled)
        NSLog(@"Message cancelled");
    else if (result == MessageComposeResultSent)
        NSLog(@"Message sent");
    else
        NSLog(@"Message failed");
}
    
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"in prepare for segue.....");
    NSLog(@"segue identifier: %@", [segue identifier]);
    // Make sure your segue name in storyboard is the same as this line
    if ([[segue identifier] isEqualToString:@"get_access_code"])
    {
        // Get reference to the destination view controller
        //GetCodeViewController *vc = [[GetCodeViewController alloc] init];
        ShowCodeViewController *vc = [segue destinationViewController];
        
        // Pass any objects to the view controller here, like...
        NSLog(@"the code is: %@", password_code);
        vc.code_value = password_code;
    }
}

 
-(NSString *)randomPassword {
    //$scope.getRandomPassword = function (len){
        
    // Characters to include in the generator
    NSString *allChars = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890!@#$%^&*()-_+=~<>;";
    NSMutableString *pwd = [[NSMutableString alloc] init];
        
    for(int i=0; i<12; i++){
         [pwd appendFormat: @"%C", [allChars characterAtIndex: arc4random_uniform([allChars length])]];
    }
    
    NSLog(@"random password= %@", pwd);
    _password.text = pwd;
    return pwd;
}
- (IBAction)hourClicked:(id)sender {
    //respond to click on hour button
    //NSTimeInterval *now = (NSInterval)timeIntervalSince1970
    NSTimeInterval timeStamp = [[NSDate date] timeIntervalSince1970];
    NSInteger timestamp_int = (int)timeStamp;
    timestamp_int += 3600;
    expirationValue = timestamp_int;
    
    [self buttonClicked:_hour_btn];
    [self buttonUnclicked:_day_btn];
    [self buttonUnclicked:_week_btn];
    [self buttonUnclicked:_custom_btn];
    
    NSLog(@"dictionary= %ld", (long)expirationValue);
    
    
}
- (IBAction)dayClicked:(id)sender {
    //respond to click on day button
    NSTimeInterval timeStamp = [[NSDate date] timeIntervalSince1970];
    NSInteger timestamp_int = (int)timeStamp;
    timestamp_int += 86400;
    expirationValue = timestamp_int;
    
    [self buttonClicked:_day_btn];
    [self buttonUnclicked:_hour_btn];
    [self buttonUnclicked:_week_btn];
    [self buttonUnclicked:_custom_btn];
    
    NSLog(@"dictionary= %ld", (long)expirationValue);
}
    


- (IBAction)weekClicked:(id)sender {
    //respond to click on week button
    NSTimeInterval timeStamp = [[NSDate date] timeIntervalSince1970];
    NSInteger timestamp_int = (int)timeStamp;
    timestamp_int += 604800;
    expirationValue = timestamp_int;
    
    [self buttonClicked:_week_btn];
    [self buttonUnclicked:_hour_btn];
    [self buttonUnclicked:_day_btn];
    [self buttonUnclicked:_custom_btn];
    
    NSLog(@"dictionary= %ld", (long)expirationValue);
}

- (IBAction)customClicked:(id)sender {
    //respond to click on custom button
    [_dateView setHidden:NO];
}


- (void)buttonClicked:(UIButton *)button {
    [button setBackgroundColor:[UIColor clearColor]];
    button.layer.shadowColor = [UIColor clearColor].CGColor;
    button.layer.shadowOffset = CGSizeMake(0.0, 0.0);
    button.layer.shadowOpacity = 0.0;
    button.layer.shadowRadius = 0.0;
    //[button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [[button layer] setBorderWidth:2.0f];
    [[button layer] setBorderColor:[UIColor whiteColor].CGColor];
}

- (void)buttonUnclicked:(UIButton *)button {
    [button setBackgroundColor:[UIColor blackColor]];
    button.layer.shadowColor = [UIColor blackColor].CGColor;
    button.layer.shadowOffset = CGSizeMake(5.0, 5.0);
    button.layer.shadowOpacity = 0.65;
    button.layer.shadowRadius = 2.0;

    
    [button setBackgroundColor:[UIColor whiteColor]];
    //[button setTitleColor:self.view.tintColor forState:UIControlStateNormal];
    //[[button layer] setBorderColor:[UIColor whiteColor].CGColor];

}
- (IBAction)backgroundTap:(id)sender {
    if ((_dateView.hidden == NO)) {
        NSLog(@"in date view visible");
        NSDate *dateChosen = [_datePicker date];
        [_dateView setHidden:YES];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
        
        NSTimeInterval timeInterval = [dateChosen timeIntervalSince1970];
        if (timeInterval < 0) {
            [errorMessageDate show];
            [_dateView setHidden:NO];
            return;
        }
        
        [self buttonClicked:_custom_btn];
        [self buttonUnclicked:_hour_btn];
        [self buttonUnclicked:_day_btn];
        [self buttonUnclicked:_week_btn];
        
        expirationValue = timeInterval;
        
        //NSString *date_str = [formatter stringFromDate:dateChosen];
        //[submissionDict setObject:date_str forKey:@"expiration"];
        //NSLog(@"dictionary= %@", submissionDict);
    }
    
}
- (IBAction)plusView:(id)sender {
    if ([_max_views.text isEqual: @"∞"]) {
        [_max_views setText:@"1"];
        return;
    }
    NSString *currentViews = _max_views.text;
    NSString *newMaxViews = [self incrementMaxViews:currentViews];
    [_max_views setText:newMaxViews];
}

- (IBAction)minusView:(id)sender {
    if ([_max_views.text isEqual: @"1"]) {
        [_max_views setText:@"∞"];
    }
    if ([_max_views.text isEqual: @"∞"]) {
        return;
    }
    NSString *currentViews = _max_views.text;
    NSString *newMaxViews = [self decrementMaxViews:currentViews];
    [_max_views setText:newMaxViews];
}

-(NSString *)incrementMaxViews:(NSString *)maxViews {
    NSInteger currentViewsInt = [maxViews intValue];
    NSInteger newViewsInt = currentViewsInt + 1;
    NSString *newViewsStr = [NSString stringWithFormat:@"%ld", (long)newViewsInt];
    return newViewsStr;
    
}


-(NSString *)decrementMaxViews:(NSString *)maxViews {
    NSInteger currentViewsInt = [maxViews intValue];
    NSInteger newViewsInt = currentViewsInt - 1;
    NSString *newViewsStr = [NSString stringWithFormat:@"%ld", (long)newViewsInt];
    return newViewsStr;
    
}

- (IBAction)addContact:(id)sender {
    // This example is to be run on iOS 8.0.
    /*
    if ([self isRunningOn8] == NO)
    {
        return;
    }
    */
    ABPeoplePickerNavigationController *picker = [[ABPeoplePickerNavigationController alloc] init];
    picker.peoplePickerDelegate = self;
    
    [self presentViewController:picker animated:YES completion:nil];
}


// A selected person is returned with this method.
- (void)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker didSelectPerson:(ABRecordRef)person
{
    ABMultiValueRef phone_field = (ABMultiValueRef) ABRecordCopyValue(person, kABPersonPhoneProperty);
    NSString *phone;
    phone =  (__bridge NSString *)ABMultiValueCopyValueAtIndex(phone_field, 0);
    
    [phoneNums appendString:[NSString stringWithFormat:@"%@", phone]];
    [phoneNums appendString:(@"  ")];
    [_contacts setText:phoneNums];
    
    //NSString *contactName = CFBridgingRelease(ABRecordCopyCompositeName(person));
    //NSLog(@"phone num= %@", phone);
    //self.resultLabel.text = [NSString stringWithFormat:@"Picked %@", contactName ? contactName : @"No Name"];
    
    
}

- (void)go_home:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



@end
