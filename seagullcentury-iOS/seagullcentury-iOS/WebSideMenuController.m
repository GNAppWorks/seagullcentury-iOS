//
//  XYZNewSettingsTableViewController.m
//  seagullcentury-iOS
//
//  Created by Brandon Altvater on 4/7/14.
//  Copyright (c) 2014 Salisbury University. All rights reserved.
//

#import "WebSideMenuController.h"
#import "XYZMenuItem.h"
#import "XYZswslideViewController.h"

@interface WebSideMenuController ()

@property NSMutableArray *settingsListItem;
@property (weak, nonatomic) IBOutlet UITableView *tableWebView;

@end

@implementation WebSideMenuController
@synthesize tableWebView;

-(void) loadInitalData
{
    // Popluate the array's data in this section
    NSUserDefaults *mapDefaults = [NSUserDefaults standardUserDefaults];
    
    XYZMenuItem *item1 = [[XYZMenuItem alloc] init];
    item1.itemName = @"Seagull Century Website";
    item1.urlName = @"http://www.seagullcentury.org";
    item1.toggleState = [mapDefaults boolForKey:@"speed"]; // Needs to be set from the use Defaults
    //item1.toggleValue = 1; // Needs to be changed from the user defaults
    [self.settingsListItem addObject:item1];
    
    XYZMenuItem *item2 = [[XYZMenuItem alloc] init];
    item2.itemName = @"Seagull Century Vendors";
    item2.urlName = @"http:/orgs.salisbury.edu/math";
    item2.toggleState = [mapDefaults boolForKey:@"vendor"];
    //item2.toggleState = NO;
    //item2.toggleValue = 0;
    [self.settingsListItem addObject:item2];
    
    
    
    XYZMenuItem *item3 = [[XYZMenuItem alloc] init];
    item3.itemName = @"Leaf Let Map";
    item3.urlName = @"http://fairview.salisbury.edu/websites/exercise/";
    item3.toggleState = [mapDefaults boolForKey:@"waypoints"];
    [self.settingsListItem addObject:item3];
    
    /*
     XYZMenuItem *item4 = [[XYZMenuItem alloc] init];
     item4.itemName = @"100 Mile Route Map";
     item4.urlName = @"http://fairview.salisbury.edu/websites/exercise/";
     [self.homeListItems addObject:item4];
     */
    NSLog(@"I have loaded the settings");
    
}


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.settingsListItem = [[NSMutableArray alloc] init];
    [self loadInitalData];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    NSLog(@"Side Menu Loaded");
    // Set the gesture
    [tableWebView addGestureRecognizer:self.revealViewController.panGestureRecognizer];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    // Return the number of rows in the section.
    return [self.settingsListItem count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"WebSettingsList";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    XYZMenuItem *toDoItem = [self.settingsListItem objectAtIndex:indexPath.row];
    cell.textLabel.text = toDoItem.itemName;
    
    
    
    UISwitch *aSwitch = [[UISwitch alloc] initWithFrame:CGRectZero];
    [cell addSubview:aSwitch];
    cell.accessoryView = aSwitch;
    
    [(UISwitch *) cell.accessoryView setOn:toDoItem.toggleState];
    cell.accessoryView.tag = indexPath.row;
    [(UISwitch *) cell.accessoryView addTarget:self action:@selector(eventSwitchChanged:) forControlEvents:UIControlEventValueChanged];
    
    
    return cell;
}


-(void) eventSwitchChanged: (id)sender
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    UISwitch * theSwitch = (UISwitch *) sender;
    //BOOL theSwitchisOn = theSwitch.isOn;
    
    // NSLog(@"The Bool Value %i",theSwitchisOn);
    
    long number = ((UISwitch*) sender).tag;
    
    NSLog(@"This is the row that was selected %li",number);
    
    switch (number) {
        case 0:
            [defaults setBool:theSwitch.isOn forKey:@"speed"];
            NSLog(@"Changed the speed to value %i", theSwitch.isOn);
            break;
        case 1:
            [defaults setBool:theSwitch.isOn forKey:@"vendor"];
            NSLog(@"Changed the vender to value %i", theSwitch.isOn);
            break;
        case 2:
            [defaults setBool:theSwitch.isOn forKey:@"waypoints"];
            NSLog(@"Changed the waypoints to value %i", theSwitch.isOn);
            break;
            
        default:
            break;
    }
    
    
    
    // Change the toggle user default settings in this method
    
}



/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
