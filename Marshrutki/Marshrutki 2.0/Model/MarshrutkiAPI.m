//
//  MarshrutkiAPI.m
//  Marshrutki 2.0
//
//  Created by Monro on 29.01.14.
//  Copyright (c) 2014 Andrey Starostenko. All rights reserved.
//

#import "MarshrutkiAPI.h"
#import "Route.h"

@implementation MarshrutkiAPI

+ (MarshrutkiAPI *) sharedClients{
    static MarshrutkiAPI *_sharedClient = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{ _sharedClient = [[MarshrutkiAPI alloc]init];});
    
    return _sharedClient;
}

-(void)getRoutes:(void (^)(NSArray *, NSError *))block params:(NSDictionary *)params{
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    void(^mySuccesBlock)(AFHTTPRequestOperation *operation, id responseObject) = ^(AFHTTPRequestOperation *operation, id responseObject){
        NSArray* rawRoute = (NSArray*)responseObject;
        
        NSMutableArray *routes = [[NSMutableArray alloc]init];
        
        for (NSDictionary* attributes in rawRoute) {
            [routes addObject:[Route initRouteWithDictionary:attributes]];
        }

        if (block != nil) {
            block(routes, nil);
        }
    };
    
    void(^failureBlock)(AFHTTPRequestOperation *operation, NSError *error) = ^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        if (block != nil) {
            block(nil, error);
        }
    };
    
    [manager GET:ROUTES_URL parameters:nil success: mySuccesBlock  failure:failureBlock];
}

@end
