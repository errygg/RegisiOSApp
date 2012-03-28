//
//  NewsViewController.h
//  RegisApplication
//
//  Created by Erik Rygg on 11/13/11.
//  Copyright (c) 2011 Regis University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RSSKit.h"

@class RSSParser;

@interface NewsViewController : UIViewController <RSSParserDelegate> {
    NSMutableArray *rssItems_;
}

@property (nonatomic, retain) NSMutableArray *rssItems;
@property (nonatomic, retain) IBOutlet UITableView *tableView;

@end
