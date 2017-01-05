//
//  TracerouteTagsDataSources.m
//  Bryan Yuan
//
//  Created by Bryan Yuan on 1/5/17.
//  Copyright © 2017 Bryan Yuan. All rights reserved.
//

#import "TracerouteTagsDataSources.h"

#define KEY_TRACERT_TAGS        @"TracertTags"

@implementation TracerouteTagsEntry

@end

@interface TracerouteTagsDataSources ()

@property NSMutableArray<TracerouteTagsEntry *> *tagsArray;
@end

@implementation TracerouteTagsDataSources

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _tagsArray = [self loadProperty];
    }
    
    return self;
}

- (NSString *)identifier
{
    return KEY_TRACERT_TAGS;
}

-(NSMutableArray<TracerouteTagsEntry *> *)loadProperty
{
    NSUserDefaults *localPref = [NSUserDefaults standardUserDefaults];
    NSArray *temp = [localPref objectForKey:[self identifier]];
    
    if (!temp) {
        temp = @[
                 @{@"host":@"192.168.1.1", @"title":@"Gateway"},
                 @{@"host":@"8.8.8.8", @"title":@"DNS"},
                 @{@"host":@"www.google.com", @"title":@"Google"}
                 ];
    }
    
    NSMutableArray *propertyArray = [[NSMutableArray alloc] init];
    for(NSDictionary *dict in temp) {
        TracerouteTagsEntry *prop = [[TracerouteTagsEntry alloc] init];
        prop.host = [dict valueForKey:@"host"];
        prop.title = [dict valueForKey:@"title"];
        
        [propertyArray addObject:prop];
    }
    
    return propertyArray;
}

- (void)dumpProperty
{
    
    NSMutableArray *propertyArray = [[NSMutableArray alloc] init];
    for (TracerouteTagsEntry *tagsEntry in self.tagsArray) {
        NSDictionary *dict = @{@"title":tagsEntry.title, @"host":tagsEntry.host};
        [propertyArray addObject:dict];
    }
    
    NSArray *inmutableArray = [NSArray arrayWithArray:propertyArray];
    NSUserDefaults *localPref = [NSUserDefaults standardUserDefaults];
    [localPref setObject:inmutableArray forKey:[self identifier]];
    return;
}

- (NSString *)titleAtIndex:(NSUInteger)index
{
    TracerouteTagsEntry *pingTagsEntry = [self.tagsArray objectAtIndex:index];
    return [pingTagsEntry title];
}
- (NSString *)hostAtIndex:(NSUInteger)index
{
    TracerouteTagsEntry *pingTagsEntry = [self.tagsArray objectAtIndex:index];
    return [pingTagsEntry host];
}
- (UIColor *)colorAtIndex:(NSUInteger)index
{
    UIColor *color;
    switch (index) {
        case 0:
            color = COLOR_WITH_HEX(0x90d52d);
            break;
        case 1:
            color = COLOR_WITH_HEX(0xead483);
            break;
        case 2:
            color = COLOR_WITH_HEX(0xf58a6e);
            break;
        case 3:
            color = COLOR_WITH_HEX(0x92e2fd);
            break;
        case 4:
            color = COLOR_WITH_HEX(0xf58a6e);
            break;
        case 5:
            color = COLOR_WITH_HEX(0x92e2fd);
            break;
        case 6:
            color = COLOR_WITH_HEX(0x90d52d);
            break;
            
        default:
            color = [UIColor whiteColor];
            break;
    }
    return color;
}
- (UIColor *)borderColorAtIndex:(NSUInteger)index
{
    UIColor *color;
    switch (index) {
        case 0:
            color = COLOR_WITH_HEX(0xe7f2d0);
            break;
        case 1:
            color = COLOR_WITH_HEX(0xfef6ce);
            break;
        case 2:
            color = COLOR_WITH_HEX(0xffccbf);
            break;
        case 3:
            color = COLOR_WITH_HEX(0xdef2fe);
            break;
        case 4:
            color = COLOR_WITH_HEX(0xffccbf);
            break;
        case 5:
            color = COLOR_WITH_HEX(0xdef2fe);
            break;
        case 6:
            color = COLOR_WITH_HEX(0xe7f2d0);
            break;
            
        default:
            color = COLOR_WITH_HEX(0x92e2fd);
            break;
    }
    return color;
}
- (NSUInteger)count
{
    return [self.tagsArray count];
}

- (void)insertEntryWithTitle:(NSString *)title host:(NSString *)host
{
    TracerouteTagsEntry *prop = [[TracerouteTagsEntry alloc] init];
    prop.host = host;
    prop.title = title;
    
    [self.tagsArray addObject:prop];
    [self dumpProperty];
}

@end

