//
//  ProgramViewController.h
//  RegisApplication
//
//  Created by Erik Rygg on 3/22/12.
//  Copyright (c) 2012 Regis University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <RestKit/RestKit.h>
#import "Program.h"

@interface ProgramViewController : UIViewController <RKObjectLoaderDelegate>

@property (nonatomic, retain) Program *program;
@property (nonatomic, retain) NSArray *programArray;
@property (nonatomic, retain) IBOutlet UITableView *tableView;

- (void) loadPrograms;

@end
