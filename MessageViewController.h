//
//  MessageViewController.h
//  City Ignite
//
//  Created by Super on 4/9/17.
//  Copyright © 2017 dmc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MessageViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>


@property (weak, nonatomic) IBOutlet UITableView *tableView;
- (IBAction)onBackBtnClick:(id)sender;

@end
