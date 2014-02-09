//
//  ViewController.m
//  Marshrutki 2.0
//
//  Created by Monro on 22.01.14.
//  Copyright (c) 2014 Andrey Starostenko. All rights reserved.
//

#import "LoginViewController.h"
#import "User.h"
#import <FacebookSDK.h>

@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textLogin;
@property (weak, nonatomic) IBOutlet UITextField *textPassword;

@end

@implementation LoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(facebookLoginComplete) name:@"FACEBOOKTOKEN" object:nil];
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
} // hide navigation bar

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)facebookLogin:(UIButton *)sender {
    
    [FBSession renewSystemCredentials:^(ACAccountCredentialRenewResult result, NSError *error) {
        [[FBSession activeSession] closeAndClearTokenInformation];
        
        [FBSession openActiveSessionWithPermissions:@[@"email"] allowLoginUI:YES completionHandler:^(FBSession *session, FBSessionState status, NSError *error) {
            if (session.accessTokenData.accessToken) {
                NSLog(@"%@", session.accessTokenData.accessToken);
            }
        }];
    }];
}

- (IBAction)actionLogin:(UIButton *)sender {
    NSLog(@"login: %@", self.textLogin.text);
    NSLog(@"password: %@", self.textPassword.text);
    
    User *user = [User userWithName:self.textLogin.text andPassword:self.textPassword.text];
    [user login];
    
    [self dismissViewControllerAnimated:YES completion:nil]; // see it later
}

- (void)facebookLoginComplete{
    [self dismissViewControllerAnimated:YES completion:nil]; // see it later
}

@end
