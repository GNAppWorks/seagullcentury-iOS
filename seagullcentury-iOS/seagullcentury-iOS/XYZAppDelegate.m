//
//  XYZAppDelegate.m
//  seagullcentury-iOS
//
//  Created by Brandon Altvater on 2/24/14.
//  Copyright (c) 2014 Salisbury University. All rights reserved.
//

#import "XYZAppDelegate.h"

@implementation XYZAppDelegate

-(void)updateGeoJSONFiles
{
    //applications Documents dirctory path
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    //retrieves the route and restStop GeoJSON files from the server and stores them locally
    NSString *stringRoutePointURL = @"http://apps.esrgc.org/maps/foodshed/data/route.geojson.";
    //change when a restStop geoJSON is uploaded to Server
   // NSString *stringRestPointURL = @"http://apps.esrgc.org/maps/foodshed/data/route.geojson.";
    
    NSURL *routeUrl = [NSURL URLWithString:stringRoutePointURL];
    //NSURL *restUrl = [NSURL URLWithString:stringRestPointURL];
    
    NSData *urlRouteData = [NSData dataWithContentsOfURL:routeUrl];
    //NSData *urlRestData = [NSData dataWithContentsOfURL:restUrl];
    
    //attempt to download live data
    if (urlRouteData)
    {
        //file to write to
        NSString *filePath = [NSString stringWithFormat:@"%@/%@", documentsDirectory,@"route.geojson"];
        // write file to device
        [urlRouteData writeToFile:filePath atomically:YES];
        NSLog(@"I loaded the Route GEOJSON in location %@", filePath);
    }
    /* blocking off the rest geojson data
    else if (urlRestData)
    {
        //file to write to
        NSString *filePath = [NSString stringWithFormat:@"%@/%@", documentsDirectory,@"rest.geojson"];
        // write file to device
        [urlRouteData writeToFile:filePath atomically:YES];
    }*/
    //copy data from initial package into the applications Documents folder
    else
    {
        //file to write to
        NSString *routeFilePath = [NSString stringWithFormat:@"%@/%@", documentsDirectory,@"route.geojson"];
        //NSString *restFilePath = [NSString stringWithFormat:@"%/%@", documentsDirectory,@"rest.geojson"];
        
        //file to copy from
        NSString *routeJson = [[NSBundle mainBundle] pathForResource:@"route" ofType:@"geojson" inDirectory:@"leaftlet_File" ];
        NSData *routeJsonData = [NSData dataWithContentsOfFile:routeJson options:kNilOptions error:nil];
        
        /*NSString *restJson = [[NSBundle mainBundle] pathForResource:@"rest"  ofType:@"geojson" inDirectory:@"leaftLet_File"];
        NSData *restJsonData = [NSData dataWithContentsOfFile:restJson options:kNilOptions error:nil];
        */
        //write file to device
        [routeJsonData writeToFile:routeFilePath atomically:YES];
        //[restJsonData writeToFile:restFilePath atomically:YES];
        
        NSLog(@"I loaded the STATIC Route GEOJSON in location %@", routeFilePath);
    }
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{

    [self updateGeoJSONFiles];
    // Override point for customization after application launch.
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
