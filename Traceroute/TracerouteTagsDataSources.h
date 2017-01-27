//
//  TracerouteTagsDataSources.h
//  Bryan Yuan
//
//  Created by Bryan Yuan on 1/5/17.
//  Copyright © 2017 Bryan Yuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TracerouteTagsEntry : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *host;

@end

@interface TracerouteTagsDataSources : NSObject

- (NSString *)titleAtIndex:(NSUInteger)index;
- (NSString *)hostAtIndex:(NSUInteger)index;
- (UIColor *)colorAtIndex:(NSUInteger)index;
- (UIColor *)borderColorAtIndex:(NSUInteger)index;
- (NSUInteger)count;

- (void)insertEntryWithTitle:(NSString *)title host:(NSString *)host;
@end
