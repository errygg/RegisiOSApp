//
//  MapViewController.m
//  RegisApplication
//
//  Created by Erik Rygg on 10/18/11.
//  Copyright (c) 2011 Regis University. All rights reserved.
//

#import "MapViewController.h"
#import "Annotations.h"

@implementation MapViewController

@synthesize mapView;

- (void)viewDidLoad {

    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
    // Add the coordinates and annotations
    NSMutableArray *annotations=[[NSMutableArray alloc] init];
    
    CLLocationCoordinate2D location1;
    location1.latitude = 39.789083;
    location1.longitude = -105.030885;
    Annotations *annotation1 = [[Annotations alloc] init];
    annotation1.title = @"North Denver (Main Campus)";
    annotation1.subtitle = @"3333 Regis Boulevard, Denver, CO 80221";
    annotation1.coordinate = location1;

    CLLocationCoordinate2D location2;
    location2.latitude = 39.602167;
    location2.longitude = -104.89053;
    Annotations *annotation2 = [[Annotations alloc] init];
    annotation2.title = @"Tech Center Campus";
    annotation2.subtitle = @"6380 S. Fiddlers Green Cr., Suite 200, Greenwood Village, CO 80111";
    annotation2.coordinate = location2;

    CLLocationCoordinate2D location3;
    location3.latitude = 40.409279;
    location3.longitude = -105.001433;
    Annotations *annotation3 = [[Annotations alloc] init];
    annotation3.title = @"Loveland Campus";
    annotation3.subtitle = @"1605 Foxtrail Drive, Loveland, CO 80538";
    annotation3.coordinate = location3;

    CLLocationCoordinate2D location4;
    location4.latitude = 39.915085;
    location4.longitude = -105.120792;
    Annotations *annotation4 = [[Annotations alloc] init];
    annotation4.title = @"Broomfield Campus";
    annotation4.subtitle = @"11001 West 120th Avenue, Suite 150, Broomfield, CO 80021";
    annotation4.coordinate = location4;

    CLLocationCoordinate2D location5;
    location5.latitude = 39.849057;
    location5.longitude = -104.980824;
    Annotations *annotation5 = [[Annotations alloc] init];
    annotation5.title = @"Thornton Dual Language Campus";
    annotation5.subtitle = @"500 East 84th Avenue, Thornton, CO 80229";
    annotation5.coordinate = location5;
    
    CLLocationCoordinate2D location6;
    location6.latitude = 38.939183;
    location6.longitude = -104.811652;
    Annotations *annotation6 = [[Annotations alloc] init];
    annotation6.title = @"Colorado Springs Campus";
    annotation6.subtitle = @"7450 Campus Drive, Suite 100, Colorado Springs, CO 80920";
    annotation6.coordinate = location6;
    
    CLLocationCoordinate2D location7;
    location7.latitude = 36.028937;
    location7.longitude = -115.086401;
    Annotations *annotation7 = [[Annotations alloc] init];
    annotation7.title = @"Henderson Campus";
    annotation7.subtitle = @"1401 North Green Valley Parkway, Suite 100, Henderson, NV 89074";
    annotation7.coordinate = location7;
    
    [mapView addAnnotation:annotation1];
    [annotations addObject:annotation1];
    [mapView addAnnotation:annotation2];
    [annotations addObject:annotation2];
    [mapView addAnnotation:annotation3];
    [annotations addObject:annotation3];
    [mapView addAnnotation:annotation4];
    [annotations addObject:annotation4];
    [mapView addAnnotation:annotation5];
    [annotations addObject:annotation5];
    [mapView addAnnotation:annotation6];
    [annotations addObject:annotation6];
    [mapView addAnnotation:annotation7];
    [annotations addObject:annotation7];
    
    // Create a rectangle with made up of the annotations
    MKMapRect flyTo = MKMapRectNull;
	for( Annotations *annotation in annotations ) {
        
        MKMapPoint annotationPoint = MKMapPointForCoordinate( annotation.coordinate );
        MKMapRect pointRect = MKMapRectMake(annotationPoint.x, annotationPoint.y, 0, 0);
        if( MKMapRectIsNull(flyTo) ) {
            flyTo = pointRect;
        } else {
            flyTo = MKMapRectUnion( flyTo, pointRect );
        }

    }
    
    // Position the map so that all overlays and annotations are visible on screen.
    mapView.visibleMapRect = flyTo;

}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    
    NSLog(@"Adding annotation info");
    
    if( [annotation isKindOfClass:[MKUserLocation class]] ) {
        return nil;
    }
    
    static NSString *AnnotationIdentifier = @"AnnotationIdentifier";
    MKPinAnnotationView *pinView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:AnnotationIdentifier];
    pinView.animatesDrop = YES;
    pinView.canShowCallout = YES;
    pinView.pinColor = MKPinAnnotationColorPurple;

    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    [rightButton setTitle:annotation.title forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(showDetails) forControlEvents:UIControlEventTouchUpInside];
    //pinView.rightCalloutAccessoryView = rightButton;
    
    UIImageView *profileIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"seal.png"]];
	pinView.leftCalloutAccessoryView = profileIconView;
    
    return pinView;

}

-(IBAction)showDetails:(id)sender {
    
	NSLog(@"Annotation Click");
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
