//
//  HomeViewController.m
//  seagullcentury-iOS
//
//  Created by Brandon Altvater on 4/1/14.
//  Copyright (c) 2014 Salisbury University. All rights reserved.
//

#import "HomeViewController.h"
#import "UIViewController+ECSlidingViewController.h"
#import "XYZLeafletMapViewController.h"
#import "XYZswslideViewController.h"


@interface HomeViewController ()

@property (strong, nonatomic) IBOutlet UIView *myView;
@property (weak, nonatomic) IBOutlet UIView *firstInfoBox;
@property (weak, nonatomic) IBOutlet UIView *secondInfoBox;

- (IBAction)goToMap:(UIButton *)sender;

-(void) backgroundSetup;
@end

@implementation HomeViewController

@synthesize myView, scrollView;
@synthesize firstInfoBox, secondInfoBox;
@synthesize urlRoute;
NSString* globalurl = nil;

-(void) setDefaults
{
    NSUserDefaults *mapDefaults = [NSUserDefaults standardUserDefaults];
    
    [mapDefaults setBool:1 forKey:@"speed"];
    [mapDefaults setBool:0 forKey:@"vendor"];
    [mapDefaults setBool:1 forKey:@"waypoints"];
    
    [mapDefaults synchronize];
    
    NSLog(@"Data has been saved\n");
}

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
    [self backgroundSetup];
    [self setDefaults];
    NSLog(@"I am in the main");
    
}
- (void)viewDidLayoutSubviews {
    self.scrollView.contentSize = CGSizeMake(320, 500);
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation
// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    
    if ([segue.identifier isEqualToString:@"toRouteView"])
    {
        //XYZLeafletMapViewController *vc = [[segue.destinationViewController viewControllers] objectAtIndex:0];
        //vc.urlFromtext = urlRoute;
        
        //XYZswslideViewController *vc = segue.destinationViewController;
        //urlFrom = urlRoute;
        //NSLog(@"Inisde prepare fucntion %@",urlRoute);
        globalurl = urlRoute;
        
    }

    
    
     

}

- (IBAction)unwindToMainMenu:(UIStoryboardSegue *)segue
{
    //[self viewDidLoad];
    [self.routePicker setSelectedSegmentIndex:UISegmentedControlNoSegment];
    
}

- (IBAction)goToMap:(UISegmentedControl *)sender
{
    // Need to change to live server site on release!!!
    switch (self.routePicker.selectedSegmentIndex) {
        case MILE100:
            urlRoute = @"http://apps.esrgc.org/maps/seagullcentury/index.html?route=0";
            //urlRoute = @"file:///Users/Brandon/Documents/Development/seagullcentury-leaflet/index.html?route=0";
            NSLog(@"100 Mile Route Selected");
            break;
        case MILE50:
            urlRoute = @"http://apps.esrgc.org/maps/seagullcentury/index.html?route=1";
            //urlRoute = @"file:///Users/Brandon/Documents/Development/seagullcentury-leaflet/index.html?route=1";
            NSLog(@"50 Mile Route Selected");
            break;
        case METRIC100:
            urlRoute = @"http://apps.esrgc.org/maps/seagullcentury/index.html?route=2";
            //urlRoute = @"file:///Users/Brandon/Documents/Development/seagullcentury-leaflet/index.html?route=2";
            NSLog(@"100 KM Route Selected");
            break;
        case METRIC50:
            NSLog(@"50 KM Route Selected");
            break;
        default:
            break;
    }
}
- (IBAction)menuButtonTapped:(id)sender {
    
    /*
    //Check the current position
    if([self.slidingViewController currentTopViewPosition]==2){
        //show menu
        [self.slidingViewController anchorTopViewToRightAnimated:YES];
    }else{
        //Dismiss menu
        [self.slidingViewController resetTopViewAnimated:YES];
    }
     */
    
    if (self.slidingViewController.currentTopViewPosition == ECSlidingViewControllerTopViewPositionCentered) {
        [self.slidingViewController anchorTopViewToRightAnimated:YES];
    } else {
        [self.slidingViewController resetTopViewAnimated:YES];
    }
    
}

#pragma mark - Design Setup
- (void) backgroundSetup
{
    //add background
    UIImageView *background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"SU_background.png"]];
    [myView addSubview:background];
    [myView sendSubviewToBack:background];
    myView.contentMode = UIViewContentModeScaleAspectFit;
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:143/255.0f green:17/255.0f blue:17/255.0f alpha:1]];
    [self.navigationController.navigationBar setTintColor:[UIColor yellowColor]];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    firstInfoBox.layer.cornerRadius = 8;
    firstInfoBox.layer.masksToBounds = YES;
    secondInfoBox.layer.cornerRadius = 8;
    secondInfoBox.layer.masksToBounds = YES;
    
}
@end
