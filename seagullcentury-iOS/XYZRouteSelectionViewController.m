//
//  XYZRouteSelectionViewController.m
//  seagullcentury-iOS
//
//  Created by Brandon Altvater on 3/7/14.
//  Copyright (c) 2014 Salisbury University. All rights reserved.
//

#import "XYZRouteSelectionViewController.h"

@interface XYZRouteSelectionViewController ()

@end

@implementation XYZRouteSelectionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)unwindToListRouteController:(UIStoryboardSegue *)segue
{
    
}

@end
