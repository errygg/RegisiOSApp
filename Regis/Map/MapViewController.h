//
//  MapViewController.h
//  RegisApplication
//
//  Created by Erik Rygg on 10/18/11.
//  Copyright (c) 2011 Regis University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface MapViewController : UIViewController <UIApplicationDelegate,
                                                 CLLocationManagerDelegate,
                                                 MKMapViewDelegate,
                                                 UITextFieldDelegate> {
    
    CLLocationManager *locationManager_;
    IBOutlet MKMapView *mapView_;
                            
}

@property (nonatomic, retain) IBOutlet MKMapView *mapView;

@end
