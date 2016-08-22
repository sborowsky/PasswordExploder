//
//  ViewController.m
//  Password Exploder
//
//  Created by Samuel Borowsky on 6/8/15...
//  Copyright (c) 2015 LookFar. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    
    //create header for view controller that says "Welcome"

    UIView *subview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 60)];
    subview.backgroundColor = [UIColor colorWithRed:(60/255.0) green:(60/255.0) blue:(60/255.0) alpha:1]; //set the background color of the title label to dark gray
    //subview.backgroundColor = [UIColor blackColor];
    
    UILabel *title_label = [[UILabel alloc] init];
    title_label.frame = CGRectMake(0, (subview.frame.size.height/2)-12, subview.frame.size.width, 45);
    title_label.textAlignment = NSTextAlignmentCenter;
    title_label.font = [UIFont fontWithName:@"Courier" size:36];
    title_label.textColor = [UIColor whiteColor];
    title_label.text = @"Welcome";
    
    [subview addSubview:title_label];
    [self.view addSubview:subview];
    
    //format the "SHARE" button
    _share_btn.layer.shadowColor = [UIColor blackColor].CGColor;
    _share_btn.layer.shadowOffset = CGSizeMake(7.0, 7.0);
    _share_btn.layer.shadowOpacity = 0.9;
    _share_btn.layer.shadowRadius = 3.0;
    [[_share_btn layer] setBorderWidth:2.0f];
    [[_share_btn layer] setBorderColor:[UIColor blackColor].CGColor];
    
    //format the "ACCESS" button
    _access_btn.layer.shadowColor = [UIColor blackColor].CGColor;
    _access_btn.layer.shadowOffset = CGSizeMake(7.0, 7.0);
    _access_btn.layer.shadowOpacity = 0.9;
    _access_btn.layer.shadowRadius = 3.0;
    [[_access_btn layer] setBorderWidth:2.0f];
    [[_access_btn layer] setBorderColor:[UIColor blackColor].CGColor];
    
    //format the "FAQ" button
    _faq_btn.layer.shadowColor = [UIColor blackColor].CGColor;
    _faq_btn.layer.shadowOffset = CGSizeMake(7.0, 7.0);
    _faq_btn.layer.shadowOpacity = 0.9;
    _faq_btn.layer.shadowRadius = 3.0;
    [[_faq_btn layer] setBorderWidth:2.0f];
    [[_faq_btn layer] setBorderColor:[UIColor blackColor].CGColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}


-(IBAction)prepareForUnwind:(UIStoryboardSegue *)segue {
}

@end
