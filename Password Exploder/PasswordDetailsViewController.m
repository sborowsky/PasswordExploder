//
//  PasswordDetailsViewController.m
//  Password Exploder
//
//  Created by Samuel Borowsky on 6/16/15.
//  Copyright (c) 2015 LookFar. All rights reserved.
//

#import "PasswordDetailsViewController.h"

@interface PasswordDetailsViewController ()

@end

@implementation PasswordDetailsViewController

@synthesize password_str, username_str, notes_str, expiration_str, num_views_str, password_details, password_label, explodePassword, access_code, explode_txtview;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //create header for view controller that says "Password Details"
    
    UIView *subview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 60)];
    subview.backgroundColor = [UIColor colorWithRed:(60/255.0) green:(60/255.0) blue:(60/255.0) alpha:1]; //set the background color of the title label to royal blue
    
    UILabel *title_label = [[UILabel alloc] init];
    title_label.frame = CGRectMake(0, (subview.frame.size.height/2)-12, subview.frame.size.width, 45);
    title_label.textAlignment = NSTextAlignmentCenter;
    title_label.font = [UIFont fontWithName:@"Courier" size:36];
    title_label.textColor = [UIColor whiteColor];
    title_label.text = @"Details";
    
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
    
    NSInteger y_tracker = 255;
    
    self.password_str = [password_details objectForKey:@"password"];
    self.username_str = [password_details objectForKey:@"username"];
    self.notes_str = [password_details objectForKey:@"note"];
    
    double expiration_double = [[password_details objectForKey:@"expiration"] doubleValue];
    NSTimeInterval expiration_stamp = (NSTimeInterval)expiration_double;
    NSDate *expiration_date = [NSDate dateWithTimeIntervalSince1970:expiration_stamp];
    NSDateFormatter *dateformatter=[[NSDateFormatter alloc]init];
    [dateformatter setLocale:[NSLocale currentLocale]];
    [dateformatter setDateFormat:@"MM/dd/yyyy hh:mm a"];
    self.expiration_str = [dateformatter stringFromDate:expiration_date];
    NSLog(@"expiration string: %@", expiration_str);
    
    NSString *expiration_str_pretty1 = [expiration_str substringWithRange:NSMakeRange(0, 10)];
    NSString *expiration_str_pretty2 = [expiration_str substringWithRange:NSMakeRange(11, 8)];
    
    NSString *expiration_str_final1 = [expiration_str_pretty1 stringByAppendingString:@"  at  "];
    NSString *expiration_str_final2 = [expiration_str_final1 stringByAppendingString:expiration_str_pretty2];
    
    NSLog(@"formatted %@", expiration_str_final2);
    
    //NSLog(@"expiration date: %@", dateString);
    
    NSObject *num_views_int = [password_details objectForKey:@"viewcount"];
    self.num_views_str = [NSString stringWithFormat:@"%@",num_views_int];
    
    
    
    NSLog(@"the dictionary: %@", password_details);
    NSLog(@"password %@", password_str);
    NSLog(@"username %@", username_str);
    NSLog(@"notes %@", notes_str);
    NSLog(@"expiration %@", expiration_str);
    NSLog(@"num_views %@", num_views_str);
    
    //position and format the password label
    self.password_label = [[UILabel alloc] initWithFrame:CGRectMake(35,190,305,50)];
    password_label.textAlignment = NSTextAlignmentCenter;
    password_label.textColor = [UIColor blackColor];
    password_label.font = [UIFont fontWithName:@"Helvetica Neue" size:30.0];
    password_label.text = password_str;
    [self.view addSubview:password_label];
    
    //y_tracker += 50;
    
    //format and position the password expiration information
    self.expiration_label = [[UILabel alloc] initWithFrame:CGRectMake(25, y_tracker, 250, 30)];
    _expiration_label.textColor = [UIColor orangeColor];
    _expiration_label.font = [UIFont fontWithName:@"Arial" size:18];
    _expiration_label.text = @"This password explodes after: ";
    [self.view addSubview:_expiration_label];
    
    y_tracker += 25;
    
    self.expiration_txt_label = [[UILabel alloc] initWithFrame:CGRectMake(25, y_tracker, 305, 30)];
    //_expiration_txt_label.textAlignment = NSTextAlignmentCenter;
    _expiration_txt_label.textColor = [UIColor whiteColor];
    _expiration_txt_label.font = [UIFont fontWithName:@"Helvetica Neue" size:24];
    _expiration_txt_label.text = expiration_str_final2;
    [self.view addSubview:_expiration_txt_label];
    
    y_tracker += 50;

    
    //format and add the total views information
    self.views_beg_label = [[UILabel alloc] initWithFrame:CGRectMake(25, y_tracker, 100, 30)];
    _views_beg_label.numberOfLines = 2;
    _views_beg_label.textColor = [UIColor orangeColor];
    _views_beg_label.font = [UIFont fontWithName:@"Arial" size:18];
    _views_beg_label.text = @"Total views: ";
    [self.view addSubview:_views_beg_label];
    
    self.views_txt_label = [[UILabel alloc] initWithFrame:CGRectMake(135, y_tracker, 50, 30)];
    _views_txt_label.textColor = [UIColor whiteColor];
    _views_txt_label.font = [UIFont fontWithName:@"Arial" size:18];
    _views_txt_label.text = num_views_str;
    [self.view addSubview:_views_txt_label];
    
    y_tracker += 50;
    
    if (![username_str isEqualToString:@""]){
        self.username_label = [[UILabel alloc] initWithFrame:CGRectMake(25, y_tracker, 90, 30)];
        _username_label.textColor = [UIColor orangeColor];
        _username_label.font = [UIFont fontWithName:@"Arial" size:18];
        _username_label.text = @"Username: ";
        [self.view addSubview:_username_label];
        
        self.username_txt_label = [[UILabel alloc] initWithFrame:CGRectMake(135, y_tracker, 150, 30)];
        _username_txt_label.textColor = [UIColor whiteColor];
        _username_txt_label.font = [UIFont fontWithName:@"Arial" size:18];
        _username_txt_label.text = username_str;
        [self.view addSubview:_username_txt_label];
        
        y_tracker += 50;
    }
    
    if (![notes_str isEqualToString:@""]){
        self.notes_label = [[UILabel alloc] initWithFrame:CGRectMake(25, y_tracker, 70, 30)];
        _notes_label.textColor = [UIColor orangeColor];
        _notes_label.font = [UIFont fontWithName:@"Arial" size:18];
        _notes_label.text = @"Notes: ";
        [self.view addSubview:_notes_label];
        
        self.notes_txt_view = [[UITextView alloc] initWithFrame:CGRectMake(90, y_tracker, 260, 135)];
        _notes_txt_view.backgroundColor = [UIColor darkGrayColor];
        _notes_txt_view.textColor = [UIColor whiteColor];
        _notes_txt_view.font = [UIFont fontWithName:@"Arial" size:16];
        _notes_txt_view.text = notes_str;
        _notes_txt_view.editable = NO;
        [self.view addSubview:_notes_txt_view];
        
        //y_tracker += 100;
    }
    
    /*
    self.views_beg_label = [[UILabel alloc] initWithFrame:CGRectMake(35, y_tracker, 100, 30)];
    _views_beg_label.numberOfLines = 2;
    _views_beg_label.textColor = [UIColor orangeColor];
    _views_beg_label.font = [UIFont fontWithName:@"Arial" size:18];
    _views_beg_label.text = @"Total views: ";
    [self.view addSubview:_views_beg_label];
    
    self.views_txt_label = [[UILabel alloc] initWithFrame:CGRectMake(145, y_tracker, 50, 30)];
    _views_txt_label.textColor = [UIColor whiteColor];
    _views_txt_label.font = [UIFont fontWithName:@"Arial" size:18];
    _views_txt_label.text = num_views_str;
    [self.view addSubview:_views_txt_label];

    y_tracker += 60;
    
     
    self.expiration_label = [[UILabel alloc] initWithFrame:CGRectMake(35, y_tracker, 250, 30)];
    _expiration_label.textColor = [UIColor orangeColor];
    _expiration_label.font = [UIFont fontWithName:@"Arial" size:18];
    _expiration_label.text = @"This password explodes after: ";
    [self.view addSubview:_expiration_label];
    
    y_tracker += 40;
    
    self.expiration_txt_label = [[UILabel alloc] initWithFrame:CGRectMake(35, y_tracker, 305, 30)];
    //_expiration_txt_label.textAlignment = NSTextAlignmentCenter;
    _expiration_txt_label.textColor = [UIColor whiteColor];
    _expiration_txt_label.font = [UIFont fontWithName:@"Helvetica Neue" size:24];
    _expiration_txt_label.text = expiration_str_final2;
    [self.view addSubview:_expiration_txt_label];
    
    y_tracker += 80;
    */
    
    //create and format the manually explode password button
    self.explodePassword = [[UIButton alloc] initWithFrame:CGRectMake(35, 590, 305, 50)];
    explodePassword.titleLabel.font = [UIFont fontWithName:@"Arial Bold" size:20.0];
    [explodePassword setTitle:@"Manually Explode Password" forState:UIControlStateNormal];
    explodePassword.backgroundColor = [UIColor colorWithRed:(243/255.0) green:(107/255.0) blue:(51/255.0) alpha:1];
    
    explodePassword.layer.cornerRadius = 3.0;
    explodePassword.layer.masksToBounds = YES;
    explodePassword.layer.shadowColor = [UIColor blackColor].CGColor;
    explodePassword.layer.shadowOffset = CGSizeMake(5.0, 5.0);
    explodePassword.layer.shadowOpacity = 0.9;
    explodePassword.layer.shadowRadius = 8.0;
    [[explodePassword layer] setBorderWidth:2.0f];
    [[explodePassword layer] setBorderColor:[UIColor blackColor].CGColor];
    [explodePassword addTarget:self action:@selector(manuallyExplode:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:explodePassword];
    
    //create and format the password has been exploded message
    self.explode_txtview = [[UITextView alloc] initWithFrame:CGRectMake(60, 300, 255, 200)];
    explode_txtview.textAlignment = UITextAlignmentCenter;
    explode_txtview.backgroundColor = [UIColor darkGrayColor];
    explode_txtview.textColor = [UIColor blackColor];
    explode_txtview.font = [UIFont fontWithName:@"Arial" size:24];
    explode_txtview.text = @"This password has successfully been deleted";
    explode_txtview.editable = NO;
    explode_txtview.hidden = YES;
    [self.view addSubview:explode_txtview];
    
}

- (IBAction)manuallyExplode:(id)sender{
    NSLog(@"in manually explode...");
    
    //instantiate password access code
    self.access_code = [password_details objectForKey:@"id"];
    
    NSString *urlString = [NSString stringWithFormat: @"https://passwordexploder.com/api/passwords/%@", access_code];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:urlString]];
    [request setHTTPMethod:@"DELETE"];
    
    //NSString *returnString = [[NSString alloc] initWithContentsOfURL:[NSURL URLWithString:urlString] encoding:NSUTF8StringEncoding error:nil];
    
    NSURLResponse *requestResponse;
    NSData *requestHandler = [NSURLConnection sendSynchronousRequest:request returningResponse:&requestResponse error:nil];
    
    //NSError *error2;
    
    /*
    self.replyDict = [NSJSONSerialization
                      JSONObjectWithData:requestHandler
                      options:NSJSONReadingMutableContainers
                      error:&error2];
    
    NSLog(@"API response %@", _replyDict);
    //NSLog(@"error: %@", error2);
    //if (error2 != NULL) {
    
    if ([replyDict objectForKey:@"id"] == NULL){
        //the access code is invalid
        //instantiate the invalid code error message
        UIAlertView *error_message = [[UIAlertView alloc] initWithTitle:@"Sorry"
                                                                message:@"The code provided is not valid."
                                                               delegate:self
                                                      cancelButtonTitle:@"OK"
                                                      otherButtonTitles:nil];
        [error_message show];
        return;
    }
    */
    
    [password_label setHidden:YES];
    [_expiration_label setHidden:YES];
    [_expiration_txt_label setHidden:YES];
    [_views_beg_label setHidden:YES];
    [_views_txt_label setHidden:YES];
    [_username_label setHidden:YES];
    [_username_txt_label setHidden:YES];
    [_notes_label setHidden:YES];
    [_notes_txt_view setHidden:YES];
    [explodePassword setHidden:YES];
    
    [explode_txtview setHidden:NO];
    
    
}

- (IBAction)go_home:(id)sender {
    [self performSegueWithIdentifier:@"unwindHome2" sender:self];

}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
