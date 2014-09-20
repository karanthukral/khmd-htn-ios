//
//  htmAnnotation.h
//  htn-ios
//
//  Created by Karan Thukral on 2014-09-20.
//  Copyright (c) 2014 Karan Thukral. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "htnMapAnnotationView.h"

@interface htmAnnotation : NSObject <MKAnnotation>
{
//        CLLocationCoordinate2D coordinate;
//        NSString *title;
        NSString *subtitle;
}

@property (readonly, nonatomic) CLLocationCoordinate2D coordinate;
@property (copy, nonatomic) NSString *title;

- (htnMapAnnotationView *)annotationView;
- (instancetype)initWithTitle:(NSString *)newTitle andLocation:(CLLocationCoordinate2D)newCoordinate;

@end
