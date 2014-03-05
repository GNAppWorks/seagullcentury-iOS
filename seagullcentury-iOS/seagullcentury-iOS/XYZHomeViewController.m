//
//  XYZFirstViewController.m
//  seagullcentury-iOS
//
//  Created by Brandon Altvater on 2/24/14.
//  Copyright (c) 2014 Salisbury University. All rights reserved.
//

#import "XYZHomeViewController.h"
#import "XYZMenuItem.h"
#import "XYZWebViewController.h"

@interface XYZHomeViewController ()

@property NSMutableArray *homeListItems;


@end

@implementation XYZHomeViewController


-(void) loadInitalData
{
    // Popluate the array's data in this section
    
    XYZMenuItem *item1 = [[XYZMenuItem alloc] init];
    item1.itemName = @"Seagull Century Website";
    item1.urlName = @"http://www.seagullcentury.org";
    [self.homeListItems addObject:item1];
    
    XYZMenuItem *item2 = [[XYZMenuItem alloc] init];
    item2.itemName = @"Seagull Century Vendors";
    item2.urlName = @"http:/orgs.salisbury.edu/math";
    
    [self.homeListItems addObject:item2];
    
    XYZMenuItem *item3 = [[XYZMenuItem alloc] init];
    item3.itemName = @"Leaf Let Map";
    item3.urlName = @"http://fairview.salisbury.edu/websites/exercise/";
    
    [self.homeListItems addObject:item3];
    
}

-(IBAction)unwindToList:(UIStoryboardSegue *)segue
{

}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // Create and populate the array
    self.homeListItems = [[NSMutableArray alloc] init];
    [self loadInitalData];
    
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
    return [self.homeListItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ListPrototypeCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    XYZMenuItem *toDoItem = [self.homeListItems objectAtIndex:indexPath.row];
    cell.textLabel.text = toDoItem.itemName;
    
    
    return cell;
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
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
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

 #pragma mark - Navigation
 // In a story board-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
     
     if ([segue.identifier isEqualToString:@"toWebView"])
     {
         XYZWebViewController *transferDestinationView = [[segue.destinationViewController viewControllers] objectAtIndex:0];
         
         NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
         XYZMenuItem *item4 = [[XYZMenuItem alloc] init];
         
         item4 = [self.homeListItems objectAtIndex:indexPath.row];
         NSLog(@"Item URL STRING %@", item4.urlName);
         
         transferDestinationView.urlFromtext = item4.urlName;
    
     }
     
          
 }

#pragma mark- Table view delegate
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    //XYZMenuItem *tappedItem = [self.homeListItems objectAtIndex:indexPath.row];
    //tappedItem.completed = !tappedItem.completed;
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    
}

@end
