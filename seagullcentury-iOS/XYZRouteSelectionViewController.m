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
    urlRoute = @"file:///Users/Brandon/Documents/Development/seagullcentury-leaflet/index.html?route=0";
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
    
    XYZLeafletMapViewController *vc = [[segue.destinationViewController viewControllers] objectAtIndex:0];
    
    if ([segue.identifier isEqualToString:@"toRouteView"])
    {
        /*
        // local Path Method
        NSString *path = [[NSBundle mainBundle] pathForResource:@"courseMap" ofType:@"html" inDirectory:@"leaftLet_File"];
        NSURL *url = [NSURL fileURLWithPath:path];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        vc.urlFromtext = request;
         */
        
        // String Method
        
        // Change the format of urlFromtext to NSString and set vc.urlFromtext = urlStringRequest
        // Change the XYZleaflet file to loadrequest from string function
        
        vc.urlFromtext = urlRoute;
        
    }
    if ([segue.identifier isEqualToString:@"toSUMap"])
    {
        
    }
    
    
    
}


- (IBAction)routePickerControl:(id)sender
{
    // Using local files to run simulator on
    // Need to change on release!
    switch (self.routeSelector.selectedSegmentIndex) {
        case MILE100:
            urlRoute = @"file:///Users/Brandon/Documents/Development/seagullcentury-leaflet/index.html?route=0";
            //NSLog(@"100 Mile Route Selected");
            break;
        case MILE50:
            urlRoute = @"file:///Users/Brandon/Documents/Development/seagullcentury-leaflet/index.html?route=1";
            //NSLog(@"50 Mile Route Selected");
            break;
        case METRIC100:
           urlRoute = @"file:///Users/Brandon/Documents/Development/seagullcentury-leaflet/index.html?route=2";
            //NSLog(@"100 KM Route Selected");
            break;
        case METRIC50:
           
            //NSLog(@"50 KM Route Selected");
            break;
        default:
            break;
    }
    
}
@end
