//
//  HomeViewController.m
//  RegisApplication
//
//  Created by Erik Rygg on 12/11/11.
//  Copyright (c) 2011 Erik R. Rygg. All rights reserved.
//

#import <RestKit/RestKit.h>
#import "HomeViewController.h"
#import "NewsViewController.h"
#import "MapViewController.h"
#import "FacultyViewController.h"
#import "DegreesViewController.h"
#import "TwitterViewController.h"
#import "FacebookViewController.h"
#import "YouTubeViewController.h"

@implementation HomeViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES animated:YES];

    // Clear the RKClient singleton to isolate the views
    [RKClient setSharedClient:nil];
    [RKObjectManager setSharedManager:nil];

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {

    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);

}

- (IBAction)openAddressView:(id)sender {

    NSLog(@"Opening Faculty viewer");
    FacultyViewController *facultyView = [self.storyboard instantiateViewControllerWithIdentifier:@"Faculty"];
    NSLog(@"Controller: %@", facultyView);
    [self.navigationController pushViewController:facultyView animated:YES];

}

- (IBAction)openMapView:(id)sender {

    NSLog(@"Opening Map view");
    MapViewController *mapView = [self.storyboard instantiateViewControllerWithIdentifier:@"Map"];
    NSLog(@"Controller: %@", mapView);
    [self.navigationController pushViewController:mapView animated:YES];

}

- (IBAction)openNewsView:(id)sender {

    NSLog(@"Opening News view");
    NewsViewController *newsView = [self.storyboard instantiateViewControllerWithIdentifier:@"News"];
    NSLog(@"Controller: %@", newsView);
    [self.navigationController pushViewController:newsView animated:YES];

}

- (IBAction)openCourseView:(id)sender {

    NSLog(@"Opening Course view");
    DegreesViewController *degreesView = [self.storyboard instantiateViewControllerWithIdentifier:@"Degrees"];
    NSLog(@"Controller: %@", degreesView);
    [self.navigationController pushViewController:degreesView animated:YES];

}

- (IBAction)openTwitterView:(id)sender {

    NSLog(@"Opening Twitter view");
    TwitterViewController *twitterView = [self.storyboard instantiateViewControllerWithIdentifier:@"Twitter"];
    NSLog(@"Controller: %@", twitterView);
    [self.navigationController pushViewController:twitterView animated:YES];

}

- (IBAction)openFacebookView:(id)sender {

    NSLog(@"Opening Facebook view");
    FacebookViewController *facebookView = [self.storyboard instantiateViewControllerWithIdentifier:@"Facebook"];
    NSLog(@"Controller: %@", facebookView);
    [self.navigationController pushViewController:facebookView animated:YES];

}

@end
