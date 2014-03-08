//
//  XYZRouteSelectionViewController.m
//  seagullcentury-iOS
//
//  Created by Brandon Altvater on 3/7/14.
//  Copyright (c) 2014 Salisbury University. All rights reserved.
//

#import "XYZRouteSelectionViewController.h"
#import "XYZLeafletMapViewController.h"

@interface XYZRouteSelectionViewController ()

typedef NS_ENUM(NSInteger, ROUTE){
    MILE100,
    MILE50,
    METRIC100,
    METRIC50
};

@end

@implementation XYZRouteSelectionViewController
@synthesize urlRoute;

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
    urlRoute = @"http://fairview.salisbury.edu/websites/exercise/";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)unwindToListRouteController:(UIStoryboardSegue *)segue
{
    
}

#pragma mark - Navigation
// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([segue.identifier isEqualToString:@"toRouteView"])
    {
        XYZLeafletMapViewController *vc = [[segue.destinationViewController viewControllers] objectAtIndex:0];
        vc.urlFromtext = urlRoute;
        NSLog(@"Item URL STRING %@",vc.urlFromtext);
        
        
    }
    
    
}


- (IBAction)routePickerControl:(id)sender
{
    switch (self.routeSelector.selectedSegmentIndex) {
        case MILE100:
            urlRoute = @"http://fairview.salisbury.edu/websites/exercise/";
            NSLog(@"100 Mile Route Selected");
            break;
        case MILE50:
            urlRoute = @"www.google.com";
            NSLog(@"50 Mile Route Selected");
            break;
        case METRIC100:
            urlRoute = @"www.salisbury.edu";
            NSLog(@"100 KM Route Selected");
            break;
        case METRIC50:
            urlRoute = @"www.yahoo.com";
            NSLog(@"50 KM Route Selected");
            break;
        default:
            break;
    }
    
}
@end
