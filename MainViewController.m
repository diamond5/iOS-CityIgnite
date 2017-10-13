//
//  MainViewController.m
//  City Ignite
//
//  Created by eden on 4/3/17.
//  Copyright © 2017 dmc. All rights reserved.
//

#import "MainViewController.h"
#import "ButtonCell.h"
#import "HeaderView.h"
#import "WebViewController.h"
#import "MyList.h"
#import <sys/utsname.h>

@interface MainViewController () {
    NSString *urlString;
    NSString *titleString;
}

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    // Do any additional setup after loading the view.
    self.collectionView.backgroundColor = [UIColor clearColor];
    self.collectionView.bounces = NO;
    
    self.messageCount.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelTap)];
    [self.messageCount addGestureRecognizer:tapGesture];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(receiveUpdateCountNotification:)
                                                 name:@"DidEnterForeground"
                                               object:nil];
}

- (void) receiveUpdateCountNotification:(NSNotification *) notification {

    if ([[notification name] isEqualToString:@"DidEnterForeground"]) {
        [self updateMessageCount];
    }
}

-(void)labelTap {
    NSLog(@"message Count: XXX");
    [self performSegueWithIdentifier:@"ToMessageView" sender:self];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self updateMessageCount];
}

-(void)updateMessageCount{
    NSInteger msgCount =  [MyList getInstance].m_messageList.count;
    if(msgCount == 0) {
        self.messageCount.text = @"";
    }
    else {
        self.messageCount.text = [[NSString alloc] initWithFormat:@"%ld", (long)msgCount];
    }
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

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    CGFloat width  = screenSize.width;
    CGFloat height = screenSize.height * 0.05;
    
    return CGSizeMake(width, height);
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 2;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section == 0) {
        return 12;
    } else {
        return 5;
    }
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellIdentifier = @"Cell";
    ButtonCell *cell = (ButtonCell*)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
//    for (UIView *subView in [cell subviews]) {
//        [subView removeFromSuperview];
//    }
    
//    cell.layer.borderWidth = 1;

    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:
                [cell.imageView setImage:[UIImage imageNamed:@"WilliamsDevotional"]];
                break;
            case 1:
                [cell.imageView setImage:[UIImage imageNamed:@"WhatIs"]];
                break;
            case 2:
                [cell.imageView setImage:[UIImage imageNamed:@"LetTheProphets"]];
                break;
            case 3:
                [cell.imageView setImage:[UIImage imageNamed:@"PublicChat"]];
                break;
            case 4:
                [cell.imageView setImage:[UIImage imageNamed:@"Web"]];
                break;
            case 5:
                [cell.imageView setImage:[UIImage imageNamed:@"Donate"]];
                break;
            case 6:
                [cell.imageView setImage:[UIImage imageNamed:@"Calendar"]];
                break;
            case 7:
                [cell.imageView setImage:[UIImage imageNamed:@"MediaArchive"]];
                break;
            case 8:
                [cell.imageView setImage:[UIImage imageNamed:@"HopeGlobal"]];
                break;
            case 9:
                [cell.imageView setImage:[UIImage imageNamed:@"Podcast"]];
                break;
            case 10:
                [cell.imageView setImage:[UIImage imageNamed:@"Facebook"]];
                break;
            case 11:
                [cell.imageView setImage:[UIImage imageNamed:@"Help"]];
                break;
            default:
                break;
        }
    } else {
        switch (indexPath.row) {
            case 0:
                [cell.imageView setImage:[UIImage imageNamed:@"email"]];
                break;
            case 1:
                [cell.imageView setImage:[UIImage imageNamed:@"web_tab"]];
                break;
            case 2:
                [cell.imageView setImage:[UIImage imageNamed:@"call_william"]];
                break;
            case 3:
                [cell.imageView setImage:[UIImage imageNamed:@"call_deborah"]];
                break;
            case 4:
                [cell.imageView setImage:[UIImage imageNamed:@"map"]];
                break;
            default:
                break;
        }
    }
    
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:
                urlString = @"http://www.igniteint.com/mobile/daily_devotional.html";
                titleString = @"";
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString] options:@{} completionHandler:nil];
                return;
            case 1:
                urlString = @"http://www.igniteint.com/mobile/william.html";
                titleString = @"";
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString] options:@{} completionHandler:nil];
                return;
            case 2:
                urlString = @"http://www.igniteint.com/mobile/prophets.html";
                titleString = @"";
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString] options:@{} completionHandler:nil];
                return;
            case 3:
                urlString = @"http://www.igniteint.com/mobile/general.html";
                titleString = @"";
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString] options:@{} completionHandler:nil];
                return;
            case 4:
                urlString = @"http://igniteint.com";
                titleString = @"City Ignite Int. Web Page";
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString] options:@{} completionHandler:nil];
                return;
            case 5:
                urlString = @"http://www.igniteint.com/mobile/donate.html";
                titleString = @"Donate";
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString] options:@{} completionHandler:nil];
                return;
            case 6:
                urlString = @"http://www.igniteint.com/mobile/calendar.html";
                titleString = @"Calendar";
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString] options:@{} completionHandler:nil];
                return;
            case 7:
                urlString = @"http://www.igniteint.com/mobile/media-archive.html";
                titleString = @"Media Archive";
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString] options:@{} completionHandler:nil];
                return;
            case 8:
                urlString = @"http://www.igniteint.com/mobile/hgc.html";
                titleString = @"Hope Global Compassion";
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString] options:@{} completionHandler:nil];
                return;
            case 9:
                urlString = @"http://www.igniteint.com/mobile/podcasts.html";
                titleString = @"Podcasts";
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString] options:@{} completionHandler:nil];
                return;
            case 10:
                urlString = @"https://www.facebook.com/william.m.london?ref=br_rs";
                titleString = @"Facebook";
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString] options:@{} completionHandler:nil];
                return;
            case 11:
                urlString = @"http://www.igniteint.com/mobile/help.html";
                titleString = @"Help";
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString] options:@{} completionHandler:nil];
                return;
            default:
                urlString = @"";
                break;
        }
    } else {
        switch (indexPath.row) {
            case 0:
                urlString = @"http://www.igniteint.com/mobile/email.html";
                titleString = @"";
                break;
            case 1:
                urlString = @"http://www.igniteint.com/mobile/igniteint.html";
                titleString = @"";
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString] options:@{} completionHandler:nil];
                return;
            case 2:
                urlString = @"http://www.igniteint.com/mobile/callwill.html";
                titleString = @"";
                break;
            case 3:
                urlString = @"http://www.igniteint.com/mobile/calldeb.html";
                titleString = @"";
                break;
            case 4:
                urlString = @"http://www.igniteint.com/mobile/map.html";
                titleString = @"";
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString] options:@{} completionHandler:nil];
                return;
            default:
                urlString = @"";
                break;
        }
    }
    
    
    WebViewController *webVC = [self.storyboard instantiateViewControllerWithIdentifier:@"WebViewController"];
    
    webVC.urlStr = urlString;
    webVC.titleStr = titleString;
    
    [self.navigationController pushViewController:webVC animated:YES];
    
    //[self performSegueWithIdentifier:@"toWebViewSegue" sender:self];
    
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
//    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    CGFloat width, height;
    
    struct utsname systemInfo;
    uname(&systemInfo);
    
    NSString* deviceInfo =  [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];

    if (indexPath.section == 0) {
        width  = collectionView.frame.size.width / 2 - 20.0f;
        height = width;
    } else {
        if ([deviceInfo isEqual:@"iPhone8,2"]) {
            width  = collectionView.frame.size.width/ 4.7;
        }
        else {
            width  = collectionView.frame.size.width/ 5;
        }
        
        height = collectionView.frame.size.height/11;
    }
    
    return CGSizeMake(width, height);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    if (section == 0) {
        return UIEdgeInsetsMake(10, 15, 10, 15);
    } else {
        return UIEdgeInsetsMake(0, 0, 0, 0);
    }
    
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    struct utsname systemInfo;
    uname(&systemInfo);
    
    NSString* deviceInfo = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    if ([deviceInfo  isEqual: @"iPhone8,2"]) {
        return -20;
    }
    else {
        return 0;
    }
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}


@end
