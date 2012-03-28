//
//  SchoolViewController.m
//  RegisApplication
//
//  Created by Erik Rygg on 3/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SchoolViewController.h"
#import "School.h"
#import "RegisApplication.h"

@implementation SchoolViewController

@synthesize school = school_;
@synthesize schoolArray = schoolArray_;
@synthesize tableView;

- (void)viewDidLoad {    
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [self loadSchools];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return schoolArray_.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"Gets here");
    static NSString *CellIdentifier = @"SchoolCell";
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if( cell == nil ) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        cell.textLabel.font = [UIFont boldSystemFontOfSize:14];
        cell.textLabel.lineBreakMode = UILineBreakModeWordWrap;
        cell.textLabel.numberOfLines = 2;
        NSString *name = [[schoolArray_ objectAtIndex:indexPath.row] name];
        name = [name stringByAppendingString:@" "];
        //cell.imageView.image = [UIImage imageNamed:@"man.png"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;        
    }
    
    return cell;    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    /*DetailedFacultyViewController *detail = [self.storyboard instantiateViewControllerWithIdentifier:@"AddressDetail"];
    [detail setFacultySelected:[facultyArray_ objectAtIndex:indexPath.row]];
    [self.navigationController pushViewController:detail animated:YES];*/
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void) loadSchools {
    
    RKLogConfigureByName("RestKit/ObjectMapping", RKLogLevelTrace);
    RKObjectManager *manager = [RKObjectManager objectManagerWithBaseURL:gRegisApplicationBaseURL];
    
    RKObjectMapping *objectMapping = [RKObjectMapping mappingForClass:[School class]];
    [manager.mappingProvider setMapping:objectMapping forKeyPath:@"schools"];
    [objectMapping mapKeyPath:@"name" toAttribute:@"name"];
    [objectMapping mapKeyPath:@"id" toAttribute:@"schoolId"];
    
    [manager loadObjectsAtResourcePath:@"/schools" delegate:self];
    
    
}

- (void)objectLoader:(RKObjectLoader *)objectLoader didLoadObjects:(NSArray *)objects {
    schoolArray_ = objects;
    [self.tableView reloadData];
}

- (void)objectLoader:(RKObjectLoader *)objectLoader didFailWithError:(NSError *)error {
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Error!" message:[error localizedDescription] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}

@end
