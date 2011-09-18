//
//  WebBrowserViewController.m
//  TallerBetaBeers-Demo1-WebBrowser
//
//  Created by Javier Soto on 9/11/11.
//

#import "WebBrowserViewController.h"

@implementation WebBrowserViewController

#pragma mark - View Life Cycle

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    NSURL *url = [NSURL URLWithString:@"http://www.google.es"];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];    
    [webView loadRequest:urlRequest];
}

#pragma mark - TextFieldDelegate methods

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSString *urlString;
    
    if (textField == URLTextField) {
        urlString = textField.text;
    } else {
        urlString = [NSString stringWithFormat:@"http://www.google.es/search?q=%@", textField.text];
    }
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    [webView loadRequest:[NSURLRequest requestWithURL:url]];
        
    [textField resignFirstResponder];
    
    return YES;
}

#pragma mark - WebViewDelegate Methods

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    URLTextField.text = request.URL.absoluteString;
    
    return YES;
}

#pragma mark - Memory Management

- (void)viewDidUnload {    
    [webView release];
    webView = nil;
    [searchTextField release];
    searchTextField = nil;
    [URLTextField release];
    URLTextField = nil;

    [super viewDidUnload];    
}

- (void)dealloc {    
    [webView release];
    [searchTextField release];
    [URLTextField release];

    [super dealloc];
}

@end