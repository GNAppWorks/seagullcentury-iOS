//
//  HomeViewController.h
//  seagullcentury-iOS
//
//  Created by Brandon Altvater on 4/1/14.
//  Copyright (c) 2014 Salisbury University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface HomeViewController : UIViewController

@property (retain, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *routePicker;
@property (nonatomic, weak) NSString* urlRoute;

typedef NS_ENUM(NSInteger, ROUTE){
    MILE100,
    MILE50,
    METRIC100,
    METRIC50
};

extern NSString* globalurl;

@end
