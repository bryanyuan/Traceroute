//
//  NetworkTagsCollectionViewCell.m
//  Bryan Yuan
//
//  Created by Bryan Yuan on 1/5/17.
//  Copyright © 2017 Bryan Yuan. All rights reserved.
//

#import "NetworkTagsCollectionViewCell.h"

@implementation NetworkTagsCollectionViewCell

@synthesize label;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.label = [[UILabel alloc] init];
        [self.label setFont:[UIFont systemFontOfSize:frame.size.height/2.0]];
        [self.label setTextAlignment:NSTextAlignmentCenter];
        [self addSubview:self.label];
    }
    return self;
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.label setFrame:self.bounds];
    //[self.label.layer setBorderColor:[[UIColor redColor] CGColor]];
    [self.layer setBorderWidth:0];
}

- (void)setDottedBorder
{
    [self.label.layer setBorderWidth:1];
    [self.label.layer setBorderColor:[[UIColor clearColor] CGColor]];
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    CGRect shapeRect = self.label.bounds;
    [shapeLayer setBounds:shapeRect];
    [shapeLayer setPosition:CGPointMake(0, 0)];
    [shapeLayer setFillColor:[[UIColor clearColor] CGColor]];
    [shapeLayer setStrokeColor:[[UIColor redColor] CGColor]];
    [shapeLayer setLineWidth:2.0f];
    [shapeLayer setLineJoin:kCALineJoinRound];
    [shapeLayer setLineDashPattern:
     [NSArray arrayWithObjects:[NSNumber numberWithInt:5],
      [NSNumber numberWithInt:5],
      nil]];
    [self.label.layer addSublayer:shapeLayer];
}


- (void)setLabelTitle:(NSString *)title color:(UIColor *)color borderColor:(UIColor *)borderColor
{
    [self.label setText:title];
    [self.label setBackgroundColor:color];
    if (borderColor) {
        [self.label.layer setBorderWidth:1];
        [self.label.layer setBorderColor:[borderColor CGColor]];
    }
}

@end
