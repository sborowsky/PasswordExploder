//
//  SafeViewController.m
//  Password Exploder
//
//  Created by Samuel Borowsky on 6/9/15.
//  Copyright (c) 2015 LookFar. All rights reserved.
//

#import "SafeViewController.h"

@interface SafeViewController ()

@end

@implementation SafeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //format the FAQ text views
    [[_textView1 layer] setBorderColor:[UIColor whiteColor].CGColor];
    [[_textView1 layer] setBorderWidth:1.0f];
    
    [[_textView2 layer] setBorderColor:[UIColor whiteColor].CGColor];
    [[_textView2 layer] setBorderWidth:1.0f];
    
    [[_textView3 layer] setBorderColor:[UIColor whiteColor].CGColor];
    [[_textView3 layer] setBorderWidth:1.0f];
        
    //create header for view controller that says "FAQ"
    
    UIView *subview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 60)];
    subview.backgroundColor = [UIColor colorWithRed:(60/255.0) green:(60/255.0) blue:(60/255.0) alpha:1]; //set the background color of the title label to royal blue
    
    UILabel *title_label = [[UILabel alloc] init];
    title_label.frame = CGRectMake(0, (subview.frame.size.height/2)-12, subview.frame.size.width, 45);
    title_label.textAlignment = NSTextAlignmentCenter;
    title_label.font = [UIFont fontWithName:@"Courier" size:36];
    title_label.textColor = [UIColor whiteColor];
    title_label.text = @"FAQ";
    
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

    
    //format the return home button
    _back_home_btn.layer.shadowColor = [UIColor blackColor].CGColor;
    _back_home_btn.layer.shadowOffset = CGSizeMake(5.0, 5.0);
    _back_home_btn.layer.shadowOpacity = 0.9;
    _back_home_btn.layer.shadowRadius = 2.0;
    [[_back_home_btn layer] setBorderWidth:2.0f];
    [[_back_home_btn layer] setBorderColor:[UIColor blackColor].CGColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (IBAction)go_home:(id)sender {
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
