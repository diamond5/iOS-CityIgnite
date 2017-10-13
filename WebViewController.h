//
//  WebViewController.h
//  City Ignite
//
//  Created by eden on 4/3/17.
//  Copyright © 2017 dmc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@property (strong, nonatomic) NSString *urlStr;
@property (strong, nonatomic) NSString *titleStr;
- (IBAction)onBackBtnClick:(id)sender;

@end
