//
//  MySidePanelControllerViewController.m
//  Marshrutki 2.0
//
//  Created by Monro on 26.01.14.
//  Copyright (c) 2014 Andrey Starostenko. All rights reserved.
//

#import "MySidePanelControllerViewController.h"
#import "MapViewController.h"
#import "RoutesViewController.h"

@interface MySidePanelControllerViewController ()

@end

@implementation MySidePanelControllerViewController

-(void) awakeFromNib
{
    UINavigationController *navigationController = [self.storyboard instantiateViewControllerWithIdentifier:@"centerViewController"];
    MapViewController *mapController = (MapViewController *)[navigationController topViewController];
    RoutesViewController *routeCOntroller = [self.storyboard instantiateViewControllerWithIdentifier:@"leftViewController"];
    
    routeCOntroller.mapController = mapController;
    
    [self setLeftPanel:routeCOntroller];
    [self setCenterPanel:navigationController];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
