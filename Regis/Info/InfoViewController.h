//
//  InfoViewController.h
//  RegisApplication
//
//  Created by Erik Rygg on 2/5/12.
//  Copyright (c) 2012 Erik R. Rygg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InfoViewController : UIViewController

- (IBAction)openHomeView:(id)sender;
- (IBAction)emailAuthor:(id)sender;
- (IBAction)callAuthor:(id)sender;
- (void) sendEmailTo:(NSString *)to;

@end
