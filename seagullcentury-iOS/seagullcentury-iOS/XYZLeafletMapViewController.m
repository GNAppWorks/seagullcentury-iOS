//
//  XYZSecondViewController.m
//  seagullcentury-iOS
//
//  Created by Brandon Altvater on 2/24/14.
//  Copyright (c) 2014 Salisbury University. All rights reserved.
//

#import "XYZLeafletMapViewController.h"
#import "UIViewController+ECSlidingViewController.h"

//static const CGFloat kNavBarHeight = 52.0f;
static const CGFloat kLabelHeight = 20.0f;
static const CGFloat kMargin = 10.0f;
static const CGFloat kSpacer = 9.0f;
//static const CGFloat kLabelFontSize = 12.0f;
static const CGFloat kAddressHeight = 24.0f;

@interface XYZLeafletMapViewController () <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@property (weak,nonatomic) UILabel *pageTitle;
@property (weak, nonatomic) UILabel *addressField;

- (void)loadRequestFromString:(NSString*)urlString;
- (void)loadRequestFromAddressField:(id)addressField;
- (void)updateAddress:(NSURLRequest*)request;

- (void)updateTitle:(UIWebView*)aWebView;

- (void)informError:(NSError*)error;

@end

@implementation XYZLeafletMapViewController
@synthesize urlFromtext, webView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.webView.delegate = self;
    
    /* Create the page title label */
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:143/255.0f green:17/255.0f blue:17/255.0f alpha:1]];
    [self.navigationController.navigationBar setTintColor:[UIColor yellowColor]];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    UINavigationBar *navBar = self.navigationController.navigationBar;
    CGRect labelFrame = CGRectMake(kMargin, kSpacer, navBar.bounds.size.width - 2 * kMargin, kLabelHeight);
    UILabel *label = [[UILabel alloc] initWithFrame:labelFrame];
    label.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont systemFontOfSize:16];
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    [navBar addSubview:label];
    self.pageTitle = label;
    
    /* Create the address bar */
    CGRect addressFrame = CGRectMake(kMargin, kSpacer * 2.0 + kLabelHeight, labelFrame.size.width - 20, kAddressHeight);
    UILabel *address = [[UILabel alloc] initWithFrame:CGRectOffset(addressFrame, 25, 0) ];
    address.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    address.backgroundColor = [UIColor clearColor];
    address.font = [UIFont systemFontOfSize:16];
    address.textAlignment = NSTextAlignmentLeft;
    //[navBar addSubview:address];
    //self.addressField = address;
    
    //[webView loadRequest:urlFromtext];
    [self loadRequestFromString:urlFromtext];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma  mark - Loading URLs
-(void)loadRequestFromAddressField:(id)addressField
{
    NSString *urlString = [addressField text];
    [self loadRequestFromString:urlString];
}

-(void)loadRequestFromString:(NSString *)urlString
{
    NSURL *url = [NSURL URLWithString:urlString];
    if (!url.scheme) {
        NSString* modifiedURLString = [NSString stringWithFormat:@"http://%@",urlString];
        url = [NSURL URLWithString:modifiedURLString];
    }
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:urlRequest];
}

- (void)updateAddress:(NSURLRequest*)request
{
    NSURL* url = [request mainDocumentURL];
    NSString* absoluteString = [url absoluteString];
    self.addressField.text = absoluteString;
}

#pragma mark - Updating the UI
-(void)updateTitle:(UIWebView *)aWebView
{
    NSString* pageTitle = [aWebView stringByEvaluatingJavaScriptFromString:@"document.title"];
    self.pageTitle.text = pageTitle;
}

#pragma mark - UIWebViewDelegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    [self updateAddress:request];
    return YES;
}

-(void)webViewDidStartLoad:(UIWebView *)webView
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    self.webView.scalesPageToFit = YES;
}
-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    [self updateTitle:self.webView];
    //[self updateAddress:[self.webView request]];
    
    
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    [self informError:error];
}

#pragma mark - Error Handling
- (void)informError:(NSError *)error
{
    NSString* localizedDescription = [error localizedDescription];
    UIAlertView* alertView = [[UIAlertView alloc]
                              initWithTitle:NSLocalizedString(@"Error", @"Title for error alert.")
                              message:localizedDescription delegate:nil
                              cancelButtonTitle:NSLocalizedString(@"OK", @"OK button in error alert.")
                              otherButtonTitles:nil];
    [alertView show];
}

#pragma mark - Overriden UIViewController methods
- (BOOL)hidesBottomBarWhenPushed {
    return YES;
}

- (IBAction)menuButtonTapped:(id)sender {
    
    if (self.slidingViewController.currentTopViewPosition == ECSlidingViewControllerTopViewPositionCentered) {
        [self.slidingViewController anchorTopViewToLeftAnimated:YES];
    } else {
        [self.slidingViewController resetTopViewAnimated:YES];
    }
    
}


- (IBAction)unwindToMapMenuViewController:(UIStoryboardSegue *)segue
{
    
}


@end
