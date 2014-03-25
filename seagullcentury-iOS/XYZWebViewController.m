//
//  XYZWebViewController.m
//  seagullcentury-iOS
//
//  Created by Brandon Altvater on 2/25/14.
//  Copyright (c) 2014 Salisbury University. All rights reserved.
//

#import "XYZWebViewController.h"
#import "XYZMenuItem.h"
#import "XYZHomeViewController.h"

#define VERTICAL_SHIFT 15

//static const CGFloat kNavBarHeight = 52.0f;
static const CGFloat kLabelHeight = 14.0f;
static const CGFloat kMargin = 10.0f;
static const CGFloat kSpacer = 2.0f;
//static const CGFloat kLabelFontSize = 12.0f;
static const CGFloat kAddressHeight = 24.0f;

@interface XYZWebViewController () <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *back;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *stop;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *refresh;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *forward;

@property (weak,nonatomic) UILabel *pageTitle;
@property (weak, nonatomic) UILabel *addressField;

- (void)loadRequestFromString:(NSString*)urlString;
- (void)loadRequestFromAddressField:(id)addressField;
- (void)updateAddress:(NSURLRequest*)request;

- (void)updateButtons;
- (void)updateTitle:(UIWebView*)aWebView;

- (void)informError:(NSError*)error;

@end

@implementation XYZWebViewController

@synthesize urlFromtext;

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
    
    self.webView.delegate = self;
    
    UINavigationBar *navBar = self.navigationController.navigationBar;
    
    /* Create the page title label*/
    CGRect labelFrame = CGRectMake(kMargin, kSpacer, navBar.bounds.size.width - 2 * kMargin, kLabelHeight);
    UILabel *label = [[UILabel alloc] initWithFrame:labelFrame];
    //label.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont systemFontOfSize:12];
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
    
    // After setting the urlFromtext call the load Request method
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
    if (!url.scheme)
    {
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
-(void)updateButtons
{
    self.forward.enabled = self.webView.canGoForward;
    self.back.enabled = self.webView.canGoBack;
    self.stop.enabled = self.webView.loading;
}

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
    webView.scalesPageToFit = YES;
    [self updateButtons];
}
-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    [self updateButtons];
    [self updateTitle:webView];
    [self updateAddress:[webView request]];
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    [self updateButtons];
    [self informError:error];
}

-(void) layoutPortrait{
    NSLog(@"In layoutPortrait");
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    
    
    if (UIInterfaceOrientationIsLandscape(toInterfaceOrientation)) {
        // shift the address bar upwards
        _addressField.font = [UIFont systemFontOfSize:12];
        _pageTitle.font = [UIFont systemFontOfSize:10];
        //[_addressField shiftVertically:-VERTICAL_SHIFT];
        NSLog(@"Landscape SHIFT");
        [self.pageTitle setAutoresizesSubviews:YES];
        [self.pageTitle setAutoresizingMask:UIViewAutoresizingFlexibleHeight| UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleWidth];
        
        [self.addressField setAutoresizesSubviews:YES];
        [self.addressField setAutoresizingMask:UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleWidth];
    }
    else {
        //shift the address bar downwards
        _addressField.font = [UIFont systemFontOfSize:17];
        _pageTitle.font = [UIFont systemFontOfSize:12];
        
        //[_addressField shiftVertically:VERTICAL_SHIFT];
        NSLog(@"Portrait SHIFT");
        [self.pageTitle setAutoresizesSubviews:YES];
        [self.pageTitle setAutoresizingMask:UIViewAutoresizingFlexibleHeight| UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleWidth];
        
        [self.addressField setAutoresizesSubviews:YES];
        [self.addressField setAutoresizingMask:UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleWidth];
    }
    
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

@end
