//
//  AddressViewController.m
//  RegisApplication
//
//  Created by Erik Rygg on 11/13/11.
//  Copyright (c) 2011 Regis University. All rights reserved.
//

#import "FacultyViewController.h"
#import "DetailedFacultyViewController.h"

@implementation FacultyViewController

@synthesize faculty = faculty_;
@synthesize facultyArray = facultyArray_;
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
    return facultyArray_.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if( cell == nil ) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        cell.textLabel.font = [UIFont boldSystemFontOfSize:14];
        cell.textLabel.lineBreakMode = UILineBreakModeWordWrap;
        cell.textLabel.numberOfLines = 2;
        NSString *fName = [[facultyArray_ objectAtIndex:indexPath.row] firstName];
        fName = [fName stringByAppendingString:@" "];
        NSString *lName = [[facultyArray_ objectAtIndex:indexPath.row] lastName];
        cell.textLabel.text = [fName stringByAppendingString:lName];
        cell.imageView.image = [UIImage imageNamed:@"man.png"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;        
    }
    
    return cell;    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DetailedFacultyViewController *detail = [self.storyboard instantiateViewControllerWithIdentifier:@"AddressDetail"];
    [detail setFacultySelected:[facultyArray_ objectAtIndex:indexPath.row]];
    [self.navigationController pushViewController:detail animated:YES];
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void) loadFaculty {
    
    RKLogConfigureByName("RestKit/ObjectMapping", RKLogLevelTrace);
    RKObjectManager *manager = [RKObjectManager objectManagerWithBaseURL:gRegisApplicationBaseURL];
    
    RKObjectMapping *objectMapping = [RKObjectMapping mappingForClass:[Faculty class]];
    [manager.mappingProvider setMapping:objectMapping forKeyPath:@"contacts"];
    [objectMapping mapKeyPath:@"busPhone" toAttribute:@"busPhone"];
    [objectMapping mapKeyPath:@"email" toAttribute:@"email"];
    [objectMapping mapKeyPath:@"firstName" toAttribute:@"firstName"];
    [objectMapping mapKeyPath:@"id" toAttribute:@"facultyId"];
    [objectMapping mapKeyPath:@"lastName" toAttribute:@"lastName"];
    [objectMapping mapKeyPath:@"title" toAttribute:@"title"];
    
    [manager loadObjectsAtResourcePath:@"/contacts" delegate:self];


}

- (void)objectLoader:(RKObjectLoader *)objectLoader didLoadObjects:(NSArray *)objects {
    facultyArray_ = objects;
    [self.tableView reloadData];
}

- (void)objectLoader:(RKObjectLoader *)objectLoader didFailWithError:(NSError *)error {
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Error!" message:[error localizedDescription] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}

@end
