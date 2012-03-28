//
//  Course.m
//  RegisApplication
//
//  Created by Robert Sjodin on 11/8/11.
//  Copyright (c) 2011 Regis University. All rights reserved.
//

#import "Course.h"


@implementation Course

@synthesize courseName;
@synthesize courseTitle;
@synthesize courseLocation;
@synthesize online;

- (id) initWithName:(NSString *) name andTitle:(NSString *) title andLocation:(NSString *) location andIsOnLine:(BOOL) isOnLine
{
    self = [super init];
    
    self.courseName = name;
    self.courseTitle = title;
    self.courseLocation = location;
    self.online = isOnLine;
    return self;
}

- (NSString *) toString
{
    return[NSString stringWithFormat:@"%@, %@, %@, %@", courseName, courseTitle, courseLocation, (online ? @"YES" : @"NO")];
}

@end
