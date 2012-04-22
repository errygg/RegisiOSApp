//
//  YouTubeViewController.h
//  RegisApplication
//
//  Created by Erik Rygg on 3/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GDataYouTube.h"
#import "GDataServiceGoogleYouTube.h"


@interface YouTubeViewController : UITableViewController {
    GDataFeedYouTubeVideo *feed;
}

@property (nonatomic, retain) GDataFeedYouTubeVideo *feed;

@end
