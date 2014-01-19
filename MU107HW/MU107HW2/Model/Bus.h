//
//  Bus.h
//  MU107HW2
//
//  Created by Monro on 19.01.14.
//  Copyright (c) 2014 Andrey Starostenko. All rights reserved.
//

#import "Vehicle.h"

@interface Bus : Vehicle

@property(readwrite, nonatomic) float longitude;
@property(readwrite, nonatomic) float latitude;

@end
