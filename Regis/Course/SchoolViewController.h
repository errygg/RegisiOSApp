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

@interface SchoolViewController : UIViewController <RKObjectLoaderDelegate> {
    School *school_;
    NSArray *schoolArray_;
}

@property (nonatomic, retain) School *school;
@property (nonatomic, retain) NSArray *schoolArray;
@property (nonatomic, retain) IBOutlet UITableView *tableView;

- (void) loadSchools;

@end
