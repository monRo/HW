//
//  User.h
//  MU107HW2
//
//  Created by Monro on 19.01.14.
//  Copyright (c) 2014 Andrey Starostenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property(strong, nonatomic) NSString *userName;
@property(strong, nonatomic) NSString *password;

+(User*)userWithName:(NSString*)name andPassword:(NSString*)password;
-(void)login;

@end
