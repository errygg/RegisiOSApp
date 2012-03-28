//
//  SchoolViewController.h
//  RegisApplication
//
//  Created by Erik Rygg on 3/22/12.
//  Copyright (c) 2012 Regis University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <RestKit/RestKit.h>
#import "School.h"

@interface SchoolViewController : UITableViewController
    <RKObjectLoaderDelegate, UITableViewDelegate>
{
        
    School *selectedSchool_;
    NSArray *objects_;
    
}

@property (nonatomic, retain) School *selectedSchool;
@property (nonatomic, retain) NSArray *objects;

@end
