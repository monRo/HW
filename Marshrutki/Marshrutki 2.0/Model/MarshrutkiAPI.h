//
//  MarshrutkiAPI.h
//  Marshrutki 2.0
//
//  Created by Monro on 29.01.14.
//  Copyright (c) 2014 Andrey Starostenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

@interface MarshrutkiAPI : NSObject

+ (MarshrutkiAPI *) sharedClients;

- (void)getRoutes:(void (^)(NSArray *routes, NSError *error))block params:(NSDictionary *)params;

@end
