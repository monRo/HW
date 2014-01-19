//
//  ViewController.m
//  MU107HW2
//
//  Created by Monro on 19.01.14.
//  Copyright (c) 2014 Andrey Starostenko. All rights reserved.
//

#import "LoginViewController.h"
#import "User.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textLogin;
@property (weak, nonatomic) IBOutlet UITextField *textPassword;

@end

@implementation LoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
- (IBAction)actionLogin:(UIButton *)sender {
    
    NSLog(@"login: %@", self.textLogin.text);
    NSLog(@"password: %@", self.textPassword.text);
    
    User *user = [User userWithName:self.textLogin.text andPassword:self.textPassword.text];
    [user login];
    
}

@end
