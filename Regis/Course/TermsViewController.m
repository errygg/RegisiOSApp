//
//  TermsViewController.m
//  RegisApplication
//
//  Created by Erik Rygg on 11/20/11.
//  Copyright (c) 2011 Erik R. Rygg. All rights reserved.
//

#import "TermsViewController.h"
#import "CoursesViewController.h"

@implementation TermsViewController

@synthesize termsArray = termsArray_, degreeSelected = degreeSelected_;

-(void) viewDidLoad {
    
	[super viewDidLoad];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [self setupArray];
    
}

- (void)setupArray {
    termsArray_ = [[NSMutableArray alloc] init];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [termsArray_ count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if( cell == nil ) {

        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.textLabel.font = [UIFont boldSystemFontOfSize:14];
        cell.textLabel.lineBreakMode = UILineBreakModeWordWrap;
        cell.textLabel.numberOfLines = 2;
        cell.textLabel.text = [termsArray_ objectAtIndex:indexPath.row];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    }

    return cell;    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *__strong)indexPath {
    
    CoursesViewController *coursesVC = [self.storyboard instantiateViewControllerWithIdentifier:@"Courses"];
    [coursesVC setTermSelected:[termsArray_ objectAtIndex:[indexPath row]]];
    [coursesVC setDegreeSelected:degreeSelected_];
    [self.navigationController pushViewController:coursesVC animated:YES];
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
