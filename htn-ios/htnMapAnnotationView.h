//
//  htnMapAnnotationView.h
//  htn-ios
//
//  Created by Karan Thukral on 2014-09-20.
//  Copyright (c) 2014 Karan Thukral. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface htnMapAnnotationView : MKAnnotationView

@property (strong, nonatomic) UIImageView *imageView;

- (instancetype)initWithAnnotation:(id<MKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier andFrame:(CGRect)frame;

@end
