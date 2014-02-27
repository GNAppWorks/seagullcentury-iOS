//
//  XYZThirdViewController.m
//  seagullcentury-iOS
//
//  Created by Brandon Altvater on 2/24/14.
//  Copyright (c) 2014 Salisbury University. All rights reserved.
//

#import "XYZCourseMapViewController.h"

@interface XYZCourseMapViewController ()

@end

@implementation XYZCourseMapViewController
@synthesize mapView = _mapView;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.mapView.showsUserLocation = YES;
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)zoomIn:(id)sender
{
    MKUserLocation *userLocation = _mapView.userLocation;
    MKCoordinateRegion region =
    MKCoordinateRegionMakeWithDistance (
                                        userLocation.location.coordinate, 20000, 20000);
    [_mapView setRegion:region animated:NO];
}

- (IBAction)changeMapType:(id)sender
{
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:
(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}





#pragma mark - Overriden UIViewController methods
- (BOOL)hidesBottomBarWhenPushed {
    return YES;
}
@end
