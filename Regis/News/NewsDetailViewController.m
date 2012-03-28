//
//  NewsDetailViewController.m
//  RegisApplication
//
//  Created by Erik Rygg on 11/13/11.
//  Copyright (c) 2011 Regis University. All rights reserved.
//

#import "NewsDetailViewController.h"

@implementation NewsDetailViewController

@synthesize titleTextView = titleTextView_, 
            summaryTextView = summaryTextView_,
            dateTextView = dateTextView_,
            currentlySelectedRSSItem = currentlySelectedRSSItem_;

-(void) viewDidLoad {
    
	[super viewDidLoad];
    [self.navigationController setNavigationBarHidden:NO animated:YES];


}

- (void) viewWillAppear: (BOOL) animated {
    
	[super viewWillAppear:animated];
    
	NSString *url = [currentlySelectedRSSItem_ url];
    
	if( nil != url ) {
        
		[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
		[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        
	}
    
	titleTextView_.text = [currentlySelectedRSSItem_ title];
    summaryTextView_.text = [currentlySelectedRSSItem_ summary]; 
    dateTextView_.text = [currentlySelectedRSSItem_ date];
    
}

// This will open a Safari view, but it is currenly not implemented in the storyboard
- (void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {

	if( 0 == buttonIndex ) {

		[[UIApplication sharedApplication]
         openURL:[NSURL URLWithString:[currentlySelectedRSSItem_ url] ]];

	}
}

@end
