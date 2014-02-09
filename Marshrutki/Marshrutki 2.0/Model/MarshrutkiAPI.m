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
    
    dispatch_once(&onceToken, ^{ _sharedClient = [[MarshrutkiAPI alloc]init];
    
        // CORE DATA
        _sharedClient.objectModel = [NSManagedObjectModel mergedModelFromBundles:nil];
        NSString *storePath = [[_sharedClient applicationDocumentsDirectory]stringByAppendingPathComponent:@"Marshrutki.sqlite"];
        
        _sharedClient.persistenStore = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:_sharedClient.objectModel];
        
        NSError *error;
        [_sharedClient.persistenStore addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:[NSURL fileURLWithPath:storePath] options:nil error:&error];
        
        _sharedClient.objectContext = [[NSManagedObjectContext alloc] init];
        
        _sharedClient.objectContext.persistentStoreCoordinator = _sharedClient.persistenStore;
        // CORE DATA
    });
    
    return _sharedClient;
}

-(NSString *)applicationDocumentsDirectory{
    return [NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES) lastObject];
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
};

@end
