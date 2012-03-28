//
//  NewsDetailViewController.h
//  RegisApplication
//
//  Created by Erik Rygg on 11/13/11.
//  Copyright (c) 2011 Regis University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RSSKit.h"

@class RSSEntry;

@interface NewsDetailViewController : UIViewController <UIActionSheetDelegate> {
	UITextView *titleTextView_;
    UITextView *summaryTextView_;
    UITextView *dateTextView_;
    RSSEntry *currentlySelectedRSSItem_;
}

@property (nonatomic, retain) IBOutlet UITextView *titleTextView;
@property (nonatomic, retain) IBOutlet UITextView *summaryTextView;
@property (nonatomic, retain) IBOutlet UITextView *dateTextView;
@property (nonatomic, retain) RSSEntry *currentlySelectedRSSItem;

@end
