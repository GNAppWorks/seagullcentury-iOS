//
//  XYZRouteSelectionViewController.h
//  seagullcentury-iOS
//
//  Created by Brandon Altvater on 3/7/14.
//  Copyright (c) 2014 Salisbury University. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XYZRouteSelectionViewController : UIViewController

@property (nonatomic, strong) NSURLRequest* urlRoute;

@property (strong, nonatomic) IBOutlet UISegmentedControl *routeSelector;



- (IBAction)routePickerControl:(id)sender;

@end
