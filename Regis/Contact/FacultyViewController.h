//
//  AddressViewController.h
//  RegisApplication
//
//  Created by Erik Rygg on 11/13/11.
//  Copyright (c) 2011 Regis University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <RestKit/RestKit.h>
#import "Faculty.h"

@interface FacultyViewController : UIViewController <RKObjectLoaderDelegate>

@property (nonatomic, retain) NSArray *facultyArray;
@property (nonatomic, retain) Faculty *faculty;
@property (nonatomic, retain) IBOutlet UITableView *tableView;

- (void) loadFaculty;

@end
