//
//  MainViewController.h
//  City Ignite
//
//  Created by eden on 4/3/17.
//  Copyright © 2017 dmc. All rights reserved.
//

#import "ViewController.h"

@interface MainViewController : ViewController <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (weak, nonatomic) IBOutlet UILabel *messageCount;



@end
