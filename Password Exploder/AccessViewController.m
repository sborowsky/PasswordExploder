//
//  AccessViewController.m
//  Password Exploder
//
//  Created by Samuel Borowsky on 6/9/15.
//  Copyright (c) 2015 LookFar. All rights reserved.
//

#import "AccessViewController.h"
#import "PasswordDetailsViewController.h"

@interface AccessViewController ()

@end

@implementation AccessViewController

@synthesize replyDict;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    
    //create header for view controller that says "Access"
    
    //initialize the bad access code image to hidden
    [_badCodeImage setHidden:YES];
    
    UIView *subview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 60)];
    subview.backgroundColor = [UIColor colorWithRed:(60/255.0) green:(60/255.0) blue:(60/255.0) alpha:1]; //set the background color of the title label to royal blue
    
    UILabel *title_label = [[UILabel alloc] init];
    title_label.frame = CGRectMake(0, (subview.frame.size.height/2)-12, subview.frame.size.width, 45);
    title_label.textAlignment = NSTextAlignmentCenter;
    title_label.font = [UIFont fontWithName:@"Courier" size:36];
    title_label.textColor = [UIColor whiteColor];
    title_label.text = @"Access";
    
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

    
    //format the "view password" button
    _submit_btn.layer.shadowColor = [UIColor blackColor].CGColor;
    _submit_btn.layer.shadowOffset = CGSizeMake(2.0, 2.0);
    _submit_btn.layer.shadowOpacity = 0.65;
    _submit_btn.layer.shadowRadius = 1.0;
    [[_submit_btn layer] setBorderWidth:2.0f];
    [[_submit_btn layer] setBorderColor:[UIColor blackColor].CGColor];
    
    //format the "go home" button
    _home_btn.layer.shadowColor = [UIColor blackColor].CGColor;
    _home_btn.layer.shadowOffset = CGSizeMake(5.0, 5.0);
    _home_btn.layer.shadowOpacity = 0.9;
    _home_btn.layer.shadowRadius = 2.0;
    [[_home_btn layer] setBorderWidth:2.0f];
    [[_home_btn layer] setBorderColor:[UIColor blackColor].CGColor];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)go_home:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)viewPassword:(id)sender {
    NSString *code_str = _code_field.text;
    
    NSString *urlString = [NSString stringWithFormat: @"https://passwordexploder.com/api/passwords/%@", code_str];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:urlString]];
    [request setHTTPMethod:@"GET"];
    
    //NSString *returnString = [[NSString alloc] initWithContentsOfURL:[NSURL URLWithString:urlString] encoding:NSUTF8StringEncoding error:nil];
    
    NSURLResponse *requestResponse;
    NSData *requestHandler = [NSURLConnection sendSynchronousRequest:request returningResponse:&requestResponse error:nil];
    
    NSError *error2;
    
    self.replyDict = [NSJSONSerialization
                                      JSONObjectWithData:requestHandler
                                      options:NSJSONReadingMutableContainers
                                      error:&error2];

    NSLog(@"code: %@", [replyDict objectForKey:@"id"]);
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
        [_badCodeImage setHidden:NO];
        return;
    }
    //the access code is valid
    NSLog(@"response: %@", replyDict);


    [self performSegueWithIdentifier:@"passwordDetails" sender:self];

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"in prepare for segue.....");
    NSLog(@"segue identifier: %@", [segue identifier]);
    // Make sure your segue name in storyboard is the same as this line
    if ([[segue identifier] isEqualToString:@"passwordDetails"])
    {
        // Get reference to the destination view controller
        //GetCodeViewController *vc = [[GetCodeViewController alloc] init];
        PasswordDetailsViewController *vc = [segue destinationViewController];
        
        // Pass any objects to the view controller here, like...
        //NSLog(@"the code is: %@", password_code);
        vc.password_details = replyDict;
    }
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
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
