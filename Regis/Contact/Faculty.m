//
//  Faculty.m
//  RegisApplication
//
//  Created by Robert Sjodin on 11/25/11.
//  Copyright (c) 2011 Regis University. All rights reserved.
//

#import "Faculty.h"


@implementation Faculty

@synthesize firstName_;
@synthesize lastName_;

@synthesize phone_;
@synthesize email_;
@synthesize url_;

- (id) initWithFirstName:(NSString *)firstName andLastName:(NSString *)lastName andPhone:(NSString *)phone andEmail:(NSString *)email andURL:(NSString *)url
{
    self = [super init];
    
    self.firstName_ = firstName;
    self.lastName_  = lastName;
    self.phone_ = phone;
    self.email_ = email;
    self.url_ = url;
    return self;
}

@end
