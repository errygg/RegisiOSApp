//
//  ProgramsViewController.m
//  RegisApplication
//
//  Created by Erik Rygg on 11/14/11.
//  Copyright (c) 2011 Regis University. All rights reserved.
//

#import "DegreesViewController.h"
#import "TermsViewController.h"

@implementation DegreesViewController

@synthesize degreesDict = degreesDict_;

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self setupArray];
    [self.navigationController setNavigationBarHidden:NO animated:YES];

}

- (void)setupArray {
    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    NSInteger keyCount = [[degreesDict_ allKeys] count];
    return keyCount;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSArray *array = nil;
    
    // Section 1 is Bachelors
    if( section == 0 ) {
        array  = [degreesDict_ objectForKey:@"BACHELORS"];
        
    // Section 2 is Masters
    } else if( section == 1) {
        array  = [degreesDict_ objectForKey:@"MASTERS"];
    
    // Section 3 is Certificates
    } else {
        array = [degreesDict_ objectForKey:@"CERTIFICATE"];
    }

    return [array count];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    if( cell == nil ) {

        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.textLabel.font = [UIFont boldSystemFontOfSize:14];
        cell.textLabel.lineBreakMode = UILineBreakModeWordWrap;
        cell.textLabel.numberOfLines = 2;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    }
        
    NSMutableArray *programArray = [[NSMutableArray alloc] init];
    
    NSInteger section = indexPath.section;
    
    if( section == 0 ) {
        [programArray addObjectsFromArray:[degreesDict_ objectForKey:@"BACHELORS"]];
    } else if( section == 1 ) {
        [programArray addObjectsFromArray:[degreesDict_ objectForKey:@"MASTERS"]];
    } else {
        [programArray addObjectsFromArray:[degreesDict_ objectForKey:@"CERTIFICATE"]];
    }
    
    NSString *cellValue = [programArray objectAtIndex:indexPath.row ];

    cell.textLabel.text = cellValue;
    
    return cell;    

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    TermsViewController *termsVC = [self.storyboard instantiateViewControllerWithIdentifier:@"Terms"];
    NSInteger section = indexPath.section;
    NSInteger selectedRow = indexPath.row;
    NSArray *courseArray = nil;

    [self.navigationController pushViewController:termsVC animated:YES];

    if( section == 0 ) {
        courseArray = [degreesDict_ objectForKey:@"BACHELORS"];
    } else if( section == 1 ) {
        courseArray = [degreesDict_ objectForKey:@"MASTERS"];
    } else {
        courseArray = [degreesDict_ objectForKey:@"CERTIFICATE"];        
    }

    [termsVC setDegreeSelected:[courseArray objectAtIndex:selectedRow]];

    NSLog(@"Program selected: %@", termsVC.degreeSelected);

}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    if( section == 0 ) {
        return @"Bachelor's Degrees";
    } else if( section == 1 ) {
        return @"Master's Degrees";
    } else {
        return @"Certificates";
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
