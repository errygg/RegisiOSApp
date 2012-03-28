//
//  CoursesViewController.m
//  RegisApplication
//
//  Created by Erik Rygg on 11/20/11.
//  Copyright (c) 2011 Erik R. Rygg. All rights reserved.
//

#import "CoursesViewController.h"
#import "DetailViewController.h"
#import "Course.h"

@implementation CoursesViewController

@synthesize coursesArray = coursesArray_,
            degreeSelected = degreeSelected_,
            termSelected = termSelected_;

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self setupArray];
    [self.navigationController setNavigationBarHidden:NO animated:YES];

}

- (void)setupArray {
    
    coursesArray_ = [[NSMutableArray alloc] init];
    NSLog(@"Program: %@ Term: %@", degreeSelected_, termSelected_);
    NSLog(@"Courses: %@", coursesArray_);
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [coursesArray_ count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"CoursesCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
    if( cell == nil ) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.font = [UIFont boldSystemFontOfSize:14];
    cell.textLabel.lineBreakMode = UILineBreakModeWordWrap;
    cell.textLabel.numberOfLines = 2;
    cell.textLabel.text = [[coursesArray_ objectAtIndex:indexPath.row] courseName];
    cell.detailTextLabel.text = [[coursesArray_ objectAtIndex:indexPath.row] courseTitle];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    if( [[coursesArray_ objectAtIndex:indexPath.row] online] ) {
        cell.imageView.image = [UIImage imageNamed:@"laptop.png"];
    } else {
        cell.imageView.image = [UIImage imageNamed:@"home.png"];
    }
    
    return cell;    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    DetailViewController *detail = [self.storyboard instantiateViewControllerWithIdentifier:@"Detail"];
    [detail setSelectedCourse:[coursesArray_ objectAtIndex:[indexPath row]]];
    [self.navigationController pushViewController:detail animated:YES];

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
