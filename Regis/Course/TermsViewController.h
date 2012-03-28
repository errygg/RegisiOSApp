//
//  TermsViewController.h
//  RegisApplication
//
//  Created by Erik Rygg on 11/20/11.
//  Copyright (c) 2011 Erik R. Rygg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TermsViewController : UIViewController {
    
    NSMutableArray *termsArray_;
    NSString *degreeSelected_;

}

@property (nonatomic, retain) NSMutableArray *termsArray;
@property (nonatomic, retain) NSString *degreeSelected;
    
- (void)setupArray;


@end
