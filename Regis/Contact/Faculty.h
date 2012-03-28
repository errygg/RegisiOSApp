//
//  Faculty.h
//  RegisApplication
//
//  Created by Robert Sjodin on 11/25/11.
//  Copyright (c) 2011 Regis University. All rights reserved.
//

#import "RegisApplication.h"

@interface Faculty: NSObject

@property (nonatomic, retain) NSNumber *facultyId;
@property (nonatomic, retain) NSString *firstName;
@property (nonatomic, retain) NSString *lastName;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *email;
@property (nonatomic, retain) NSString *busPhone;

@end