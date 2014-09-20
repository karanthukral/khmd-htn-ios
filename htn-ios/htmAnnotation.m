//
//  htmAnnotation.m
//  htn-ios
//
//  Created by Karan Thukral on 2014-09-20.
//  Copyright (c) 2014 Karan Thukral. All rights reserved.
//

#import "htmAnnotation.h"

@implementation htmAnnotation

- (htnMapAnnotationView *)annotationView
{
    htnMapAnnotationView *annotationView = [[htnMapAnnotationView alloc] initWithAnnotation:self reuseIdentifier:@"annotationView"];
    annotationView.enabled = YES;
    annotationView.canShowCallout = YES;
    annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    annotationView.imageView.image = [UIImage imageNamed:@"pin.png"];
    annotationView.imageView.contentMode = UIViewContentModeScaleAspectFill;
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
