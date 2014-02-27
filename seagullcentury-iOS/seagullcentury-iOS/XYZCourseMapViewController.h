//
//  XYZThirdViewController.h
//  seagullcentury-iOS
//
//  Created by Brandon Altvater on 2/24/14.
//  Copyright (c) 2014 Salisbury University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface XYZCourseMapViewController : UIViewController

@property (strong, nonatomic) IBOutlet MKMapView *mapView;

- (IBAction)zoomIn:(id)sender;
- (IBAction)changeMapType:(id)sender;



@end
