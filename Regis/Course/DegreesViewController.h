//
//  ProgramsViewController.h
//  RegisApplication
//
//  Created by Erik Rygg on 11/14/11.
//  Copyright (c) 2011 Regis University. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DegreesViewController : UIViewController {
    NSDictionary *degreesDict_;
}

@property (nonatomic, retain) NSDictionary *degreesDict;

- (void)setupArray;

@end
