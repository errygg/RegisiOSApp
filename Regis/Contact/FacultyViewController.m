//
//  AddressViewController.m
//  RegisApplication
//
//  Created by Erik Rygg on 11/13/11.
//  Copyright (c) 2011 Regis University. All rights reserved.
//

#import "FacultyViewController.h"
#import "Faculty.h"
#import "DetailedFacultyViewController.h"
#import "RegisApplication.h"

@implementation FacultyViewController

@synthesize faculty;
@synthesize facultyArray;
@synthesize tableView;

- (void)viewDidLoad {

    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [self loadFaculty];

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return facultyArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    NSLog(@"gets here");
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if( cell == nil ) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        cell.textLabel.font = [UIFont boldSystemFontOfSize:14];
        cell.textLabel.lineBreakMode = UILineBreakModeWordWrap;
        cell.textLabel.numberOfLines = 2;
        NSString *fName = [[facultyArray objectAtIndex:indexPath.row] firstName];
        fName = [fName stringByAppendingString:@" "];
        NSString *lName = [[facultyArray objectAtIndex:indexPath.row] lastName];
        cell.textLabel.text = [fName stringByAppendingString:lName];
        cell.imageView.image = [UIImage imageNamed:@"man.png"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;        
    }
    
    return cell;    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DetailedFacultyViewController *detail = [self.storyboard instantiateViewControllerWithIdentifier:@"AddressDetail"];
    [detail setFacultySelected:[facultyArray objectAtIndex:indexPath.row]];
    [self.navigationController pushViewController:detail animated:YES];
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void) loadFaculty {
    
    NSLog(@"loading faculty");
    
    RKLogConfigureByName("RestKit/ObjectMapping", RKLogLevelTrace);
    RKLogConfigureByName("RestKit/Network", RKLogLevelTrace);
    RKObjectManager *manager = [RKObjectManager objectManagerWithBaseURL:gRegisApplicationBaseURL];

    RKObjectMapping *objectMapping = [RKObjectMapping mappingForClass:[Faculty class]];
    [manager.mappingProvider setMapping:objectMapping forKeyPath:@"contacts"];
    [objectMapping mapKeyPath:@"id" toAttribute:@"facultyId"];
    [objectMapping mapKeyPath:@"busPhone" toAttribute:@"busPhone"];
    [objectMapping mapKeyPath:@"email" toAttribute:@"email"];
    [objectMapping mapKeyPath:@"firstName" toAttribute:@"firstName"];

    [objectMapping mapKeyPath:@"lastName" toAttribute:@"lastName"];
    [objectMapping mapKeyPath:@"title" toAttribute:@"title"];
    
    [manager loadObjectsAtResourcePath:@"/contacts" delegate:self];
    
    NSLog(@"loaded faculty");

}

- (void)objectLoader:(RKObjectLoader *)objectLoader didLoadObjects:(NSArray *)objects {
    facultyArray = objects;
    [self.tableView reloadData];
}

- (void)objectLoader:(RKObjectLoader *)objectLoader didFailWithError:(NSError *)error {
    NSLog(@"Gets here");
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Error!" message:[error localizedDescription] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];

}

@end
