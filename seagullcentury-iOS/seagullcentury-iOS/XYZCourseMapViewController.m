//
//  XYZThirdViewController.m
//  seagullcentury-iOS
//
//  Created by Brandon Altvater on 2/24/14.
//  Copyright (c) 2014 Salisbury University. All rights reserved.
//

#import "XYZCourseMapViewController.h"

#define METERS_PER_MILE 1609.344

@interface XYZCourseMapViewController ()

@end

@implementation XYZCourseMapViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)zoomIn:(id)sender
{

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
