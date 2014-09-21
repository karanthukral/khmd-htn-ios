//
//  htnMapViewController.m
//  htn-ios
//
//  Created by Karan Thukral on 2014-09-20.
//  Copyright (c) 2014 Karan Thukral. All rights reserved.
//

#import "htnMapViewController.h"
#import <MapKit/MapKit.h>
#import "htnAnnotation.h"
#import <CoreLocation/CoreLocation.h>
#import "HTNPostTableViewController.h"
#import "htnPost.h"
#import "HTNPostList.h"

@interface htnMapViewController () <MKMapViewDelegate>
{
    MKMapView *_mapView;
    MKCoordinateRegion region;
    int numberZoomedOut;
}

@end

@implementation htnMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _posts = [HTNPostList sharedInstance].postList;
    self.navigationItem.title = @"Bulletin";
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:106/255.0 green:56/255.0 blue:0 alpha:1];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:240/255.0 green:230/255.0 blue:212/255.0 alpha:1];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor colorWithRed:0.41 green:0.22 blue:0 alpha:1]};
    
    numberZoomedOut = 0;
    UIBarButtonItem *zoomIn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"magnify30"] style:UIBarButtonItemStylePlain target:self action:@selector(zoomIn)];
    UIBarButtonItem *zoomOut = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"Magnifying30"] style:UIBarButtonItemStylePlain target:self action:@selector(zoomOut)];
    self.navigationItem.rightBarButtonItems = @[zoomIn, zoomOut];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:@selector(goToListView)];
    [self setUpMapView];
    _mapView.scrollEnabled = NO;
    _mapView.zoomEnabled = NO;
    [self addDummyAnnotation];
}

- (void)setUpMapView
{
    _mapView = [[MKMapView alloc] initWithFrame:CGRectMake(self.view.bounds.origin.x, self.view.bounds.origin.y + 64, self.view.bounds.size.width, self.view.bounds.size.height - 64)];
    _mapView.delegate = self;
    [self.view addSubview:_mapView];
}

#warning TEMP METHOD TILL ACTUAL DATA IS ACCESSIBLE
- (void)addDummyAnnotation
{
    for (htnPost *post in _posts) {
        CLLocationCoordinate2D location = CLLocationCoordinate2DMake([post.postLat doubleValue], [post.postLong doubleValue]);
        htnAnnotation *annotation = [[htnAnnotation alloc] initWithTitle:post.postString andLocation:location forPostWithLikes:post.postNumLikes];
        [_mapView addAnnotation:annotation];
    }
    
    region = MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2DMake(45, -75), 5000, 5000);
    [_mapView setRegion:region];
}

- (void)goToListView
{
    HTNPostTableViewController *listViewController = [[HTNPostTableViewController alloc] initWithStyle:UITableViewStylePlain];
    [self.navigationController pushViewController:listViewController animated:YES];
}

- (void)zoomIn
{
    if (numberZoomedOut > 0) {
        region.span = MKCoordinateSpanMake(region.span.latitudeDelta - 0.09, region.span.longitudeDelta - 0.09);
        [_mapView setRegion:region];
        numberZoomedOut--;
    }
}

- (void)zoomOut
{
    if (numberZoomedOut < 8) {
        region.span = MKCoordinateSpanMake(region.span.latitudeDelta + 0.09, region.span.longitudeDelta + 0.09);
        [_mapView setRegion:region];
        numberZoomedOut++;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    htnAnnotation *myLoc = (htnAnnotation *)annotation;
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
    HTNPostTableViewController *listViewController = [[HTNPostTableViewController alloc] initWithStyle:UITableViewStylePlain];
    [self.navigationController pushViewController:listViewController animated:YES];
    
    //Here, the annotation tapped can be accessed using view.annotation
}

@end
