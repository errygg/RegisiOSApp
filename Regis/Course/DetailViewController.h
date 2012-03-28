//
//  DetailViewController.h
//  RegisApplication
//
//  Created by Erik Rygg on 11/13/11.
//  Copyright (c) 2011 Regis University. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Course;

@interface DetailViewController : UIViewController {
    
    UILabel *courseNumLabel_;
    UILabel *courseDescLabel_;
    UILabel *onlineLabel_;
    UILabel *locationLabel_;
    Course *selectedCourse_;
    
}

@property (nonatomic, retain) IBOutlet UIWebView *webView;
@property (nonatomic, retain) IBOutlet UILabel *courseNumLabel;
@property (nonatomic, retain) IBOutlet UILabel *courseDescLabel;
@property (nonatomic, retain) IBOutlet UILabel *onlineLabel;
@property (nonatomic, retain) IBOutlet UILabel *locationLabel;
@property (nonatomic, retain) Course *selectedCourse;

- (IBAction)goBack:(id)sender;

@end
