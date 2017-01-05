//
//  ViewController.h
//  Traceroute
//
//  Created by Bryan Yuan on 1/5/17.
//  Copyright © 2017 Bryan Yuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate>

@property IBOutlet UITextField *hostTextField;
@property IBOutlet UIButton *tracertButton;
@property IBOutlet UICollectionView *collectionView;
@property IBOutlet UITextView *textView;

- (IBAction)tracertButtonClicked:(id)sender;

@end

