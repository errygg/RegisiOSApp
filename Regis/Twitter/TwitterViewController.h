//
//  TwitterViewController.h
//  RegisApplication
//
//  Created by Erik Rygg on 2/20/12.
//  Copyright (c) 2012 Erik R. Rygg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PullRefreshTableViewController.h"

//@interface TwitterViewController : UITableViewController
@interface TwitterViewController : PullRefreshTableViewController

@property (nonatomic, retain) NSArray *tweets;

- (void) fetchTweets;

@end