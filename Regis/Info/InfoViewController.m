//
//  InfoViewController.m
//  RegisApplication
//
//  Created by Erik Rygg on 2/5/12.
//  Copyright (c) 2012 Erik R. Rygg. All rights reserved.
//

#import "InfoViewController.h"

@implementation InfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)openHomeView:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}

- (void) sendEmailTo:(NSString *)to {
	NSString *mailString = [NSString stringWithFormat:@"mailto:?to=%@",
							[to stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding]];
	
    NSLog(@"Mailing to: %@", mailString);
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:mailString]];
}

- (IBAction)emailAuthor:(id)sender {
    [self sendEmailTo:@"errygg@gmail.com"];
}

- (IBAction)callAuthor:(id)sender {
    
    UIDevice *device = [UIDevice currentDevice];

    if ([device.model isEqualToString:@"iPhone"] ) {
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"tel:(720)258-6439"]];
        [[UIApplication sharedApplication] openURL:url];
    } else {
        UIAlertView *invalidDevice = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Your device doesn't support this feature." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [invalidDevice show];
    }
}

@end
