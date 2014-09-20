//
//  htnMapViewController.m
//  htn-ios
//
//  Created by Karan Thukral on 2014-09-20.
//  Copyright (c) 2014 Karan Thukral. All rights reserved.
//

#import "htnMapViewController.h"
#import <MapKit/MapKit.h>
#import "htmAnnotation.h"
#import <CoreLocation/CoreLocation.h>

@interface htnMapViewController () <MKMapViewDelegate>
{
    MKMapView *_mapView;
}

@end

@implementation htnMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _mapView = [[MKMapView alloc] initWithFrame:self.view.frame];
    _mapView.delegate = self;
    [self.view addSubview:_mapView];
    CLLocationCoordinate2D location = CLLocationCoordinate2DMake(-45, -75);
    htmAnnotation *annotation = [[htmAnnotation alloc] initWithTitle:@"New Test" andLocation:location];
    [_mapView addAnnotation:annotation];
    MKCoordinateRegion region = MKCoordinateRegionMake(location, MKCoordinateSpanMake(50, 50));
    [_mapView setRegion:region];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    htmAnnotation *myLoc = (htmAnnotation *)annotation;
    MKAnnotationView *aView = [mapView dequeueReusableAnnotationViewWithIdentifier:@"annotationView"];
    if (!aView) {
        aView = myLoc.annotationView;
    } else {
        aView.annotation = annotation;
    }
    return aView;
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    NSLog(@"inside the stupid method");
    
    //Here, the annotation tapped can be accessed using view.annotation
}

@end
