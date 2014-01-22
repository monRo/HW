//
//  User.m
//  Marshrutki 2.0
//
//  Created by Monro on 22.01.14.
//  Copyright (c) 2014 Andrey Starostenko. All rights reserved.
//

#import "User.h"

@implementation User

+(instancetype)userWithName:(NSString *)name andPassword:(NSString *)password{
    User *user = [[User alloc] init];
    user.userName = name;
    user.password = password;
    
    return user;
}

-(void)login{
    NSLog(@"Try to login!");
}

@end