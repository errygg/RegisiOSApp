//
//  YouTubeViewController.m
//  RegisApplication
//
//  Created by Erik Rygg on 3/28/12.
//  Copyright (c) 2012 Regis University. All rights reserved.
//

#import "YouTubeViewController.h"

@interface YouTubeViewController (PrivateMethods)

- (GDataServiceGoogleYouTube *)youTubeService;

@end

@implementation YouTubeViewController

@synthesize feed;

- (void)viewDidLoad {
    
    NSLog(@"Loading youtube view");
    
    GDataServiceGoogleYouTube *service = [self youTubeService];
    
    NSString *uploadsID = kGDataYouTubeUserFeedIDUploads;

    NSURL *feedURL = [GDataServiceGoogleYouTube youTubeURLForUserID:@"RegisUniversity" userFeedID:uploadsID];
	[service fetchFeedWithURL:feedURL
                     delegate:self
            didFinishSelector:@selector(request:finishedWithFeed:error:)];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [super viewDidLoad];


}

- (void)request:(GDataServiceTicket *)ticket finishedWithFeed:(GDataFeedBase *)aFeed error:(NSError *)error {
    self.feed = (GDataFeedYouTubeVideo *)aFeed;
    [self.tableView reloadData];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[feed entries] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if( cell == nil ) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
    }
    GDataEntryBase *entry = [[feed entries] objectAtIndex:indexPath.row];
    NSString *title = [[entry title] stringValue];
    NSArray *thumbNails = [[(GDataEntryYouTubeVideo *)entry mediaGroup] mediaThumbnails];
    cell.textLabel.text = title;
    
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:[[thumbNails objectAtIndex:0] URLString]]];
    cell.imageView.image = [UIImage imageWithData:data];
    
    return cell;
    
}

- (GDataServiceGoogleYouTube *)youTubeService {
    
	static GDataServiceGoogleYouTube* service_ = nil;
	
	if (!service_) {
	
        service_ = [[GDataServiceGoogleYouTube alloc] init];
		
		[service_ setUserAgent:@"Regis_University-RegisApp-1.0"];
        [service_ setShouldCacheResponseData:YES];
		[service_ setServiceShouldFollowNextLinks:YES];
	}
	
	// fetch unauthenticated
	[service_ setUserCredentialsWithUsername:nil
                                    password:nil];
	
	return service_;
}
@end
