//
//  MapViewController.m
//  Marshrutki 2.0
//
//  Created by Monro on 22.01.14.
//  Copyright (c) 2014 Andrey Starostenko. All rights reserved.
//

#import "MapViewController.h"
#import "LoginViewController.h"
#import "Route.h"

@interface MapViewController ()

@property (weak, nonatomic) IBOutlet UILabel *labelRoute;

@end

@implementation MapViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    UIViewController *loginController = [self.storyboard instantiateViewControllerWithIdentifier:@"AuthNavigationController"];
    
    [self.navigationController presentViewController:loginController animated:NO completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)longPress:(UILongPressGestureRecognizer *)sender {
    if (sender.state == UIGestureRecognizerStateBegan) {
        NSLog(@"Looong tap!");
    }
}

-(void)selectRoute:(Route *)selectedRoute{
    self.labelRoute.text = selectedRoute.name;
}
@end
