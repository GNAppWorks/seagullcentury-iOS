//
//  XYZSecondViewController.h
//  seagullcentury-iOS
//
//  Created by Brandon Altvater on 2/24/14.
//  Copyright (c) 2014 Salisbury University. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XYZLeafletMapViewController : UIViewController

@property (nonatomic, strong) NSString* urlFromtext;

- (IBAction)unwindToMapMenuViewController:(UIStoryboardSegue *)segue;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;



@end
