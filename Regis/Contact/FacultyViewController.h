//
//  AddressViewController.h
//  RegisApplication
//
//  Created by Erik Rygg on 11/13/11.
//  Copyright (c) 2011 Regis University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Faculty.h"

@interface FacultyViewController : UIViewController <RKObjectLoaderDelegate> {
    
    Faculty *faculty_;
    NSArray *facultyArray_;
    /*UISearchBar *searchBar_;
    NSMutableArray *searchData_;*/
    
}

@property (nonatomic, retain) NSArray *facultyArray;
@property (nonatomic, retain) Faculty *faculty;
@property (nonatomic, retain) IBOutlet UITableView *tableView;
/*@property (nonatomic, retain) UISearchBar *searchBar;
@property (nonatomic, retain) NSMutableArray *searchData_;*/

- (void) loadFaculty;

@end
