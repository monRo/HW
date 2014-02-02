//
//  Route.h
//  Marshrutki 2.0
//
//  Created by Monro on 22.01.14.
//  Copyright (c) 2014 Andrey Starostenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Route : NSObject

@property(strong, nonatomic) NSString *name;
@property(strong, nonatomic) NSString *price;
@property(nonatomic) BOOL isFavorited;

+(Route*)initRouteWithDictionary: (NSDictionary *) attributes;

@end
