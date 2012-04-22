//
//  YouTubeViewController.m
//  RegisApplication
//
//  Created by Erik Rygg on 3/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
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

    NSURL *feedURL = [GDataServiceGoogleYouTube youTubeURLForUserID:@"errygg" userFeedID:uploadsID];
	[service fetchFeedWithURL:feedURL
                     delegate:self
            didFinishSelector:@selector(request:finishedWithFeed:error:)];
    [super viewDidLoad];


}

- (void)request:(GDataServiceTicket *)ticket finishedWithFeed:(GDataFeedBase *)aFeed error:(NSError *)error {
    self.feed = (GDataFeedYouTubeVideo *)aFeed;
    [self.tableView reloadData];
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (NSInteger)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
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
		
		[service_ setUserAgent:@"AppWhirl-UserApp-1.0"];
        [service_ setShouldCacheResponseData:YES];
		[service_ setServiceShouldFollowNextLinks:YES];
	}
	
	// fetch unauthenticated
	[service_ setUserCredentialsWithUsername:nil
                                    password:nil];
	
	return service_;
}
@end
