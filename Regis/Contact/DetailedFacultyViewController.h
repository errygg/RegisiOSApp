//
//  AddressDetailViewController.h
//  RegisApplication
//
//  Created by Erik Rygg on 11/26/11.
//  Copyright (c) 2011 Erik R. Rygg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Faculty.h"

@interface DetailedFacultyViewController : UIViewController {
    
    UILabel *firstName_;
    UILabel *lastName_;
    UILabel *phoneNum_;
    UILabel *emailAddr_;
    UILabel *title_;
    Faculty *facultySelected_;
    
}

@property (nonatomic, retain) IBOutlet UILabel *firstName;
@property (nonatomic, retain) IBOutlet UILabel *lastName;
@property (nonatomic, retain) IBOutlet UILabel *phoneNum;
@property (nonatomic, retain) IBOutlet UILabel *emailAddr;
@property (nonatomic, retain) IBOutlet UILabel *title;
@property (nonatomic, retain) Faculty *facultySelected;

- (IBAction) addNewContactButtonSelected;
- (IBAction) addExistingContactButtonSelected;
- (IBAction) addContactToFavorites;
- (IBAction) emailFaculty;
- (IBAction) callFaculty;
- (IBAction) openFacultyWebsite;
- (void) sendEmailTo:(NSString *)to;

@end
