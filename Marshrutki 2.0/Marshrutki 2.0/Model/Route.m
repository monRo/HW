//
//  Route.m
//  Marshrutki 2.0
//
//  Created by Monro on 22.01.14.
//  Copyright (c) 2014 Andrey Starostenko. All rights reserved.
//

#import "Route.h"

@implementation Route

+(Route*)initRouteWithDictionary: (NSDictionary *) attributes{
    Route *route = [[Route alloc]init];
    
    route.name = attributes[@"route_title"];
    
    return route;
}

@end
