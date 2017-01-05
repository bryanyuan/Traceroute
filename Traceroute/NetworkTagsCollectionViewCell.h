//
//  NetworkTagsCollectionViewCell.h
//  Bryan Yuan
//
//  Created by Bryan Yuan on 1/5/17.
//  Copyright © 2017 Bryan Yuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NetworkTagsCollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) UILabel *label;

- (void)setLabelTitle:(NSString *)title color:(UIColor *)color borderColor:(UIColor *)borderColor;
- (void)setDottedBorder;
@end
