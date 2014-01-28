//
//  RoutesViewController.h
//  Marshrutki 2.0
//
//  Created by Monro on 26.01.14.
//  Copyright (c) 2014 Andrey Starostenko. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MapViewController;

@interface RoutesViewController : UITableViewController

@property(strong, nonatomic) MapViewController* mapController;

@end
