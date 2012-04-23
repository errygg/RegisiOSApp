//
//  AddressDetailViewController.m
//  RegisApplication
//
//  Created by Erik Rygg on 11/26/11.
//  Copyright (c) 2011 Erik R. Rygg. All rights reserved.
//

#import "DetailedFacultyViewController.h"

@implementation DetailedFacultyViewController

@synthesize firstName = firstName_;
@synthesize lastName = lastName_;
@synthesize phoneNum = phoneNum_;
@synthesize emailAddr = emailAddr_;
@synthesize title = title_;
@synthesize facultySelected = facultySelected_;

- (void)viewDidLoad {

    [super viewDidLoad];
    
    firstName_.text = [facultySelected_.firstName stringByAppendingString:@" "];
    firstName_.text = [firstName_.text stringByAppendingString:facultySelected_.lastName];
    emailAddr_.text = facultySelected_.email;
    phoneNum_.text = facultySelected_.busPhone;
    title_.text = facultySelected_.title;

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)addContactToFavorites {

	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Regis" message:@"Add favorites feature still in progress."
												   delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
	[alert show];	

}

- (IBAction)addNewContactButtonSelected {
    
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Regis" message:@"Add new contact feature still in progress."
												   delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
	[alert show];	
    
}

- (IBAction)addExistingContactButtonSelected {
    
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Regis" message:@"Add to existing contact feature still in progress."
												   delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
	[alert show];	
    
}

- (void) sendEmailTo:(NSString *)to {
	NSString *mailString = [NSString stringWithFormat:@"mailto:?to=%@",
							[to stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding]];
	
    NSLog(@"Mailing to: %@", mailString);
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:mailString]];
}

- (IBAction)emailFaculty {
    [self sendEmailTo:emailAddr_.text];
}

- (IBAction)callFaculty {
    
    UIDevice *device = [UIDevice currentDevice];
    if ([[device model] isEqualToString:@"iPhone"] ) {

        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"tel:%@", phoneNum_]];

        NSLog(@"Calling: %@", url);
        [[UIApplication sharedApplication] openURL:url];

    } else {

        UIAlertView *Notpermitted=[[UIAlertView alloc] initWithTitle:@"Error" message:@"Your device doesn't support this feature." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [Notpermitted show];
    
    }
}

- (IBAction)openFacultyWebsite {
    
/*    NSURL *url = [NSURL URLWithString:[facultySelected_ url_]];
    NSLog(@"Opening website: %@", url.relativeString);

    [[UIApplication sharedApplication] openURL:url];*/
    
}

@end
