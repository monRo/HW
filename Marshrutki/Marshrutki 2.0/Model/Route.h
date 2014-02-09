//
//  Route.h
//  Marshrutki 2.0
//
//  Created by Monro on 06.02.14.
//  Copyright (c) 2014 Andrey Starostenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Route : NSManagedObject

@property BOOL * isFavorited;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * price;
@property (nonatomic, retain) NSSet *buses;

@end

@interface Route (CoreDataGeneratedAccessors)

- (void)addBusesObject:(NSManagedObject *)value;
- (void)removeBusesObject:(NSManagedObject *)value;
- (void)addBuses:(NSSet *)values;
- (void)removeBuses:(NSSet *)values;

+(Route*)initRouteWithDictionary: (NSDictionary *) attributes;

@end
