//
//  ProgramViewController.m
//  RegisApplication
//
//  Created by Erik Rygg on 3/22/12.
//  Copyright (c) 2012 Regis University. All rights reserved.
//

#import "ProgramViewController.h"
#import "RegisApplication.h"
#import "Program.h"

@implementation ProgramViewController

@synthesize programArray;
@synthesize program;
@synthesize tableView;

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [self loadPrograms];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return programArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if( cell == nil ) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        cell.textLabel.font = [UIFont boldSystemFontOfSize:14];
        cell.textLabel.lineBreakMode = UILineBreakModeWordWrap;
        cell.textLabel.numberOfLines = 2;
        NSString *name = [[programArray objectAtIndex:indexPath.row] name];
        name = [name stringByAppendingString:@" "];
        cell.textLabel.text = name;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    }
    
    return cell;    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //School *selectedSchool = [schoolArray objectAtIndex:indexPath.row];
    //NSLog(@"school id:%@", selectedSchool.schoolId);
    //ProgramViewController *programVC = [self.storyboard instantiateViewControllerWithIdentifier:@"Program"];
    //[programVC setProgramsForSchools:[schoolArray objectAtIndex:indexPath.row]];
    //[self.navigationController pushViewController:programVC animated:YES];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void) loadPrograms {

    RKLogConfigureByName("RestKit/ObjectMapping", RKLogLevelTrace);
    RKLogConfigureByName("RestKit/Network", RKLogLevelTrace);

    RKObjectManager *manager = [RKObjectManager objectManagerWithBaseURL:gRegisApplicationBaseURL];
    RKObjectMapping *objectMapping = [RKObjectMapping mappingForClass:[Program class]];
    [manager.mappingProvider setMapping:objectMapping forKeyPath:@"programs"];
    [objectMapping mapKeyPath:@"id" toAttribute:@"programId"];
    [objectMapping mapKeyPath:@"name" toAttribute:@"name"];
    [objectMapping mapKeyPath:@"schoolId" toAttribute:@"schoolId"];
    [objectMapping mapKeyPath:@"type" toAttribute:@"type"];
    
    [manager loadObjectsAtResourcePath:@"/programs" delegate:self];
    
}

- (void)objectLoader:(RKObjectLoader *)objectLoader didLoadObjects:(NSArray *)objects {
    programArray = objects;
    NSLog(@"program array:%@", programArray);
    [self.tableView reloadData];
}

- (void)objectLoader:(RKObjectLoader *)objectLoader didFailWithError:(NSError *)error {
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Error!" message:[error localizedDescription] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}

@end
