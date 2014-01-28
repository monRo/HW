//
//  MapViewController.h
//  Marshrutki 2.0
//
//  Created by Monro on 22.01.14.
//  Copyright (c) 2014 Andrey Starostenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Route;

@interface MapViewController : UIViewController
- (IBAction)longPress:(UILongPressGestureRecognizer *)sender;

- (void)selectRoute:(Route *)selectedRoute;

@end
