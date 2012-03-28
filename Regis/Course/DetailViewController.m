//
//  DetailViewController.m
//  RegisApplication
//
//  Created by Erik Rygg on 11/13/11.
//  Copyright (c) 2011 Regis University. All rights reserved.
//

#import "DetailViewController.h"
#import "Course.h"

@implementation DetailViewController

@synthesize webView;
@synthesize courseNumLabel = courseNumLabel_;
@synthesize courseDescLabel = courseDescLabel_;
@synthesize locationLabel = locationLabel_;
@synthesize onlineLabel = onlineLabel_;
@synthesize selectedCourse = selectedCourse_;

- (void)viewDidLoad {

    [super viewDidLoad];
    courseNumLabel_.text = [selectedCourse_ courseName];
    courseDescLabel_.text = [selectedCourse_ courseTitle];
    locationLabel_.text = [selectedCourse_ courseLocation];

    if( [selectedCourse_ online ] ) {
        onlineLabel_.text = @"Online";
    } else {
        onlineLabel_.text = @"In Class";
    }
    
    NSString *urlAddr = @"http://regis.edu/regis.asp?sctn=cpcis&p1=ap#ap";
    NSURL *url = [NSURL URLWithString:urlAddr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    webView.scalesPageToFit = TRUE;
    [webView loadRequest:request];
    [self.navigationController setNavigationBarHidden:NO animated:YES];

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (IBAction)goBack:(id)sender {
    [webView goBack];
}
@end

