//
//  MapViewController.m
//  Kaizen
//
//  Created by Ponnie Rohith on 28/03/15.
//  Copyright (c) 2015 PR. All rights reserved.
//

#import "MapViewController.h"
#define METERS_PER_MILE 1609.344

@interface MapViewController ()

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (void)viewWillAppear:(BOOL)animated {
    // 1
    CLLocationCoordinate2D carLocation1;
    carLocation1.latitude = 12.9747259;
    carLocation1.longitude= 77.5951533;
    CLLocationCoordinate2D carLocation2;
    carLocation2.latitude = 12.9700420;
    carLocation2.longitude= 77.6411586;
    CLLocationCoordinate2D carLocation3;
    carLocation3.latitude = 13.0917933;
    carLocation3.longitude= 77.5312953;
    CLLocationCoordinate2D carLocation4;
    carLocation4.latitude = 12.9693729;
    carLocation4.longitude= 77.6078563;
    CLLocationCoordinate2D carLocation5;
    carLocation5.latitude = 12.8817015;
    carLocation5.longitude= 77.6905970;
    
    // 2
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(carLocation1, 25*METERS_PER_MILE, 25*METERS_PER_MILE);
    self.mapView.delegate = self;
    
    // 3
    [self.mapView setRegion:viewRegion animated:YES];
    MKPointAnnotation *point1 = [[MKPointAnnotation alloc] init];
    point1.coordinate = carLocation1;
    point1.title = @"Royce";
    point1.subtitle = [NSString stringWithFormat:@"%@ %@",@"Hey! I'm going to ",self.destination];
    [self.mapView addAnnotation:point1];
    MKPointAnnotation *point2 = [[MKPointAnnotation alloc] init];
    point2.coordinate = carLocation2;
    point2.title = @"Vishnu";
    point2.subtitle = [NSString stringWithFormat:@"%@ %@",@"Hey! I'm going to ",self.destination];
    [self.mapView addAnnotation:point2];
    MKPointAnnotation *point3 = [[MKPointAnnotation alloc] init];
    point3.coordinate = carLocation3;
    point3.title = @"Manjunath";
    point3.subtitle = [NSString stringWithFormat:@"%@ %@",@"Hey! I'm going to ",self.destination];
    [self.mapView addAnnotation:point3];
    MKPointAnnotation *point4 = [[MKPointAnnotation alloc] init];
    point4.coordinate = carLocation4;
    point4.title = @"Rwithu";
    point4.subtitle = [NSString stringWithFormat:@"%@ %@",@"Hey! I'm going to ",self.destination];
    [self.mapView addAnnotation:point4];
    MKPointAnnotation *point5 = [[MKPointAnnotation alloc] init];
    point5.coordinate = carLocation5;
    point5.title = @"Nithin";
    point5.subtitle = [NSString stringWithFormat:@"%@ %@",@"Hey! I'm going to ",self.destination];
    [self.mapView addAnnotation:point5];
}
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    static NSString *identifier = @"MyLocation";
        MKAnnotationView *annotationView = (MKAnnotationView *) [self.mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
        if (annotationView == nil) {
            annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
            annotationView.enabled = YES;
            annotationView.canShowCallout = YES;
            annotationView.image = [UIImage imageNamed:@"taxi.png"];//here we use a nice image instead of the default pins
            UIButton *detailButton = [UIButton buttonWithType:UIButtonTypeContactAdd];
//            detailButton.titleLabel.text = @"Get stay";
            [detailButton addTarget:self action:@selector(annotationDetailButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
            annotationView.rightCalloutAccessoryView = detailButton;

        } else {
            annotationView.annotation = annotation;
        }
        
        return annotationView;
}
- (void)annotationDetailButtonPressed:(id)sender
{
//    MKPointAnnotation *view = (MKPointAnnotation*)[sender superview];
//    [self.delegate didConfirm:view.title];
    [self.delegate didConfirm];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
