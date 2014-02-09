//
//  RoutesViewController.h
//  Marshrutki 2.0
//
//  Created by Monro on 26.01.14.
//  Copyright (c) 2014 Andrey Starostenko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
@class MapViewController, Route;

@protocol RoutesMenuProtocol <NSObject>
- (void) didSelectRoute:(Route*)route;
@end

@interface RoutesViewController : UITableViewController

@property(strong, nonatomic) MapViewController* mapController;
@property(weak, nonatomic) id <RoutesMenuProtocol> delegate;

@end
