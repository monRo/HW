//
//  MapViewController.h
//  Marshrutki 2.0
//
//  Created by Monro on 22.01.14.
//  Copyright (c) 2014 Andrey Starostenko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "RoutesViewController.h"

@class Route;

@interface MapViewController : UIViewController <RoutesMenuProtocol>
- (IBAction)longPress:(UILongPressGestureRecognizer *)sender;
@end
