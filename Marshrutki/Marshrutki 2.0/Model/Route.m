//
//  Route.m
//  Marshrutki 2.0
//
//  Created by Monro on 06.02.14.
//  Copyright (c) 2014 Andrey Starostenko. All rights reserved.
//

#import "Route.h"


@implementation Route

@dynamic isFavorited;
@dynamic name;
@dynamic price;
@dynamic buses;

+(Route*)initRouteWithDictionary: (NSDictionary *) attributes{
    Route *route = [[Route alloc]init];
    route.name = attributes[@"route_title"];
    route.price = attributes[@"route_price"];
    
    return route;
}

@end
