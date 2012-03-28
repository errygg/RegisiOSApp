//
//  Course.h
//  RegisApplication
//
//  Created by Robert Sjodin on 11/8/11.
//  Copyright (c) 2011 Regis University. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Course : NSObject {
    
    NSString *courseName;
    NSString *courseTitle;
    NSString *courseLocation;
    BOOL online;
    
}

@property (nonatomic, retain) NSString *courseName;
@property (nonatomic, retain) NSString *courseTitle;
@property (nonatomic, retain) NSString *courseLocation;
@property BOOL online;

- (id) initWithName:(NSString *) name andTitle:(NSString *) title andLocation:(NSString *) location andIsOnLine:(BOOL) isOnLine;

- (NSString *) toString;

@end
