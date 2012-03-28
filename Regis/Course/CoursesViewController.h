//
//  CoursesViewController.h
//  RegisApplication
//
//  Created by Erik Rygg on 11/20/11.
//  Copyright (c) 2011 Erik R. Rygg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CoursesViewController : UIViewController {
    NSMutableArray *coursesArray_;
    NSString *degreeSelected_;
    NSString *termSelected_;
}

@property (nonatomic, retain) NSMutableArray *coursesArray;
@property (nonatomic, retain) NSString *degreeSelected;
@property (nonatomic, retain) NSString *termSelected;

- (void)setupArray;

@end
