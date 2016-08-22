//
//  ShowCodeViewController.m
//  Password Exploder
//
//  Created by Samuel Borowsky on 6/16/15.
//  Copyright (c) 2015 LookFar. All rights reserved.
//

#import "ShowCodeViewController.h"

@interface ShowCodeViewController ()

@end

@implementation ShowCodeViewController

@synthesize code_value;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //create header for view controller that says "Access Code"
    
    UIView *subview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 60)];
    subview.backgroundColor = [UIColor colorWithRed:(60/255.0) green:(60/255.0) blue:(60/255.0) alpha:1]; //set the background color of the title label to royal blue
    
    UILabel *title_label = [[UILabel alloc] init];
    title_label.frame = CGRectMake(0, (subview.frame.size.height/2)-12, subview.frame.size.width, 45);
    title_label.textAlignment = NSTextAlignmentCenter;
    title_label.font = [UIFont fontWithName:@"Courier" size:36];
    title_label.textColor = [UIColor whiteColor];
    title_label.text = @"Access Code";
    
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
    
    //set the value of the access code label
    _access_code.text = code_value;

    //format the access code label
    _access_code.layer.cornerRadius = 10;
    _access_code.layer.masksToBounds = YES;
    
    //format the "go home" button
    _home_btn.layer.shadowColor = [UIColor blackColor].CGColor;
    _home_btn.layer.shadowOffset = CGSizeMake(5.0, 5.0);
    _home_btn.layer.shadowOpacity = 0.9;
    _home_btn.layer.shadowRadius = 2.0;
    [[_home_btn layer] setBorderWidth:2.0f];
    [[_home_btn layer] setBorderColor:[UIColor blackColor].CGColor];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}


- (IBAction)go_home:(id)sender {
    [self performSegueWithIdentifier:@"unwindHome" sender:self];
    
}

@end
