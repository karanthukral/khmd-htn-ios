//
//  htmAnnotation.m
//  htn-ios
//
//  Created by Karan Thukral on 2014-09-20.
//  Copyright (c) 2014 Karan Thukral. All rights reserved.
//

#import "htmAnnotation.h"

@implementation htmAnnotation

- (MKAnnotationView *)annotationView
{
    MKAnnotationView *annotationView = [[MKAnnotationView alloc] initWithAnnotation:self reuseIdentifier:@"annotationView"];
    annotationView.enabled = YES;
    annotationView.canShowCallout = YES;
    annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeInfoLight];
    annotationView.image = [UIImage imageNamed:@"pin.png"];
    annotationView.contentMode = UIViewContentModeScaleAspectFit;
    return annotationView;
}

- (instancetype)initWithTitle:(NSString *)newTitle andLocation:(CLLocationCoordinate2D)newCoordinate
{
    self = [super init];
    if (self) {
        _coordinate = newCoordinate;
        _title = newTitle;
        subtitle = newTitle;
    }
    return self;
}

@end
