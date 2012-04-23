//
//  HomeViewController.m
//  RegisApplication
//
//  Created by Erik Rygg on 12/11/11.
//  Copyright (c) 2011 Erik R. Rygg. All rights reserved.
//

#import <RestKit/RestKit.h>
#import "HomeViewController.h"
#import "InfoViewController.h"

@implementation HomeViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
    [RKClient setSharedClient:nil];
    [RKObjectManager setSharedManager:nil];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)openInfoView:(id)sender {
    InfoViewController *infoView = [self.storyboard instantiateViewControllerWithIdentifier:@"Info"];
    [self.navigationController presentModalViewController:infoView animated:YES];
}

@end
