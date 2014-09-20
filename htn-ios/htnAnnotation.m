//
//  htmAnnotation.m
//  htn-ios
//
//  Created by Karan Thukral on 2014-09-20.
//  Copyright (c) 2014 Karan Thukral. All rights reserved.
//

#import "htnAnnotation.h"

@interface htnAnnotation ()
{
    NSString *imageName;
}
@end

@implementation htnAnnotation

- (MKAnnotationView *)annotationView
{
    MKAnnotationView *annotationView = [[MKAnnotationView alloc] initWithAnnotation:self reuseIdentifier:@"annotationView"];
    annotationView.enabled = YES;
    annotationView.canShowCallout = YES;
    annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeInfoLight];
    annotationView.image = [UIImage imageNamed:imageName];
    annotationView.contentMode = UIViewContentModeScaleAspectFit;
    return annotationView;
}

- (instancetype)initWithTitle:(NSString *)newTitle andLocation:(CLLocationCoordinate2D)newCoordinate forPostWithLikes:(NSNumber *)numPostLikes
{
    self = [super init];
    if (self) {
        _coordinate = newCoordinate;
        _title = newTitle;
        subtitle = newTitle;
        if ([numPostLikes integerValue] < 10) {
            imageName = @"pin32.png";
        } else if ([numPostLikes integerValue] >= 10 && [numPostLikes integerValue] < 25) {
            imageName = @"pin48.png";
        } else {
            imageName = @"pin64.png";
        }
    }
    return self;
}

@end
