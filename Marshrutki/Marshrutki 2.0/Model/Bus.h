//
//  Bus.h
//  Marshrutki 2.0
//
//  Created by Monro on 22.01.14.
//  Copyright (c) 2014 Andrey Starostenko. All rights reserved.
//

#import "Vehicle.h"

@interface Bus : Vehicle

@property(readwrite, nonatomic) float longitude;
@property(readwrite, nonatomic) float latitude;

@end
