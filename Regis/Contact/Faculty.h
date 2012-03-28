//
//  Faculty.h
//  RegisApplication
//
//  Created by Robert Sjodin on 11/25/11.
//  Copyright (c) 2011 Regis University. All rights reserved.
//

#import "RegisApplication.h"

@interface Faculty : NSManagedObject {
    
    NSString *firstName_;
    NSString *lastName_;
    NSString *busPhone_;
    NSString *email_;
    NSString *url_;
    
}

@property (nonatomic, retain) NSString *firstName;
@property (nonatomic, retain) NSString *lastName;
@property (nonatomic, retain) NSString *busPhone;
@property (nonatomic, retain) NSString *email;
@property (nonatomic, retain) NSString *url;


@end
