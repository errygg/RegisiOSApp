//
//  Annotations.h
//  RegisApplication
//
//  Created by Erik Rygg on 10/19/11.
//  Copyright (c) 2011 Regis University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MKAnnotation.h>

@interface Annotations : NSObject <MKAnnotation> {
    
    CLLocationCoordinate2D coordinate_;
    NSString *title_;
    NSString *subtitle_;
    
}

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;

@end
