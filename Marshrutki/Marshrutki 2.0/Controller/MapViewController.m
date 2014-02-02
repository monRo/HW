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
@property(strong, nonatomic) UIBarButtonItem *favoriteBarButton;
@property(strong, nonatomic) Route *currentRoute;

@end

@implementation MapViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.favoriteBarButton = [[UIBarButtonItem alloc] initWithTitle:@"★" style:UIBarButtonItemStyleBordered target:self action:@selector(favAction)];
    self.navigationItem.rightBarButtonItem = self.favoriteBarButton;
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

-(void)didSelectRoute:(Route *)route{
    self.title = route.name;
    self.currentRoute = route;
    self.favoriteBarButton.title = route.isFavorited ? @"☆" : @"★";
}

- (void)favAction{
    self.currentRoute.isFavorited = !self.currentRoute.isFavorited;
    self.favoriteBarButton.title = self.currentRoute.isFavorited ? @"☆" : @"★";
    
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_FAV_CHANGED object:nil];
}

@end
