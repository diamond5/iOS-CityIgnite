//
//  MessageViewController.m
//  City Ignite
//
//  Created by Super on 4/9/17.
//  Copyright © 2017 dmc. All rights reserved.
//

#import "MessageViewController.h"
#import "MessageViewCell.h"
#import "MyList.h"
#import "MessageData.h"

@interface MessageViewController ()
{
    NSMutableArray* messageList;
}

@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
    
    
    messageList = [MyList getInstance].m_messageList;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return messageList.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* cellIdentifier = @"MessageViewCell";
    MessageViewCell* cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(!cell)
    {
        cell = [[MessageViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    MessageData *data = [messageList objectAtIndex:indexPath.row];
    cell.messageTitle.text = data.title;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    MessageData *data = [messageList objectAtIndex:indexPath.row];
    NSString *received_date = data.received_date;
    NSString *content = data.content;
    
    UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:received_date
                                                        message:content
                                                       delegate:self
                                              cancelButtonTitle:@"Close"
                                              otherButtonTitles:nil, nil];
    [alertView show];

    
    MyList* glist = [MyList getInstance];
    [glist.m_messageList removeObjectAtIndex:indexPath.row];
    [self.tableView reloadData];
}

- (IBAction)onBackBtnClick:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

@end
