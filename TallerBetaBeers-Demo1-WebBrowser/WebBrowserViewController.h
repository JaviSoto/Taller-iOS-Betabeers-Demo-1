//
//  WebBrowserViewController.h
//  TallerBetaBeers-Demo1-WebBrowser
//
//  Created by Javier Soto on 9/11/11.
//

#import <UIKit/UIKit.h>

@interface WebBrowserViewController : UIViewController <UIWebViewDelegate, UITextFieldDelegate> {
    
    IBOutlet UIWebView *webView;
    IBOutlet UITextField *URLTextField;
    IBOutlet UITextField *searchTextField;
}

@end