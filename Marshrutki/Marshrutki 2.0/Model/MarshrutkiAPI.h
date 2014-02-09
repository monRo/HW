//
//  MarshrutkiAPI.h
//  Marshrutki 2.0
//
//  Created by Monro on 29.01.14.
//  Copyright (c) 2014 Andrey Starostenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>
#import <CoreData/CoreData.h>

@interface MarshrutkiAPI : NSObject

// Core Data
@property (strong, nonatomic) NSManagedObjectContext *objectContext;
@property (strong, nonatomic) NSManagedObjectModel *objectModel;
@property (strong, nonatomic) NSPersistentStoreCoordinator *persistenStore;
// Core Data

+ (MarshrutkiAPI *) sharedClients;

- (void)getRoutes:(void (^)(NSArray *routes, NSError *error))block params:(NSDictionary *)params;

@end
