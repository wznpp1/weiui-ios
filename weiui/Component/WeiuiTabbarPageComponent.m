//
//  WeiuiTabbarPageComponent.m
//  WeexTestDemo
//
//  Created by apple on 2018/6/4.
//  Copyright © 2018年 TomQin. All rights reserved.
//

#import "WeiuiTabbarPageComponent.h"
#import "DeviceUtil.h"

@implementation WeiuiTabbarPageComponent

- (instancetype)initWithRef:(NSString *)ref type:(NSString *)type styles:(NSDictionary *)styles attributes:(NSDictionary *)attributes events:(NSArray *)events weexInstance:(WXSDKInstance *)weexInstance
{
    self = [super initWithRef:ref type:type styles:styles attributes:attributes events:events weexInstance:weexInstance];
    if (self) {
        _tabName = @"";
        _title = @"New Page";
        _unSelectedIcon = @"";
        _selectedIcon = @"";
        _message = 0;
        _dot = NO;
        
        for (NSString *key in styles.allKeys) {
            [self dataKey:key value:styles[key] isUpdate:NO];
        }
        for (NSString *key in attributes.allKeys) {
            [self dataKey:key value:attributes[key] isUpdate:NO];
        }
    }
    return self;
}

- (void)viewDidLoad
{
    
}

-(void)updateStyles:(NSDictionary *)styles
{
    for (NSString *key in styles.allKeys) {
        [self dataKey:key value:styles[key] isUpdate:YES];
    }
}

- (void)updateAttributes:(NSDictionary *)attributes
{
    for (NSString *key in attributes.allKeys) {
        [self dataKey:key value:attributes[key] isUpdate:YES];
    }
}

- (void)insertSubview:(WXComponent *)subcomponent atIndex:(NSInteger)index
{
    [super insertSubview:subcomponent atIndex:index];
}

#pragma mark data
- (void)dataKey:(NSString*)key value:(id)value isUpdate:(BOOL)isUpdate
{
    key = [DeviceUtil convertToCamelCaseFromSnakeCase:key];
    if ([key isEqualToString:@"weiui"] && [value isKindOfClass:[NSDictionary class]]) {
        for (NSString *k in [value allKeys]) {
            [self dataKey:k value:value[k] isUpdate:isUpdate];
        }
    } else if ([key isEqualToString:@"tabName"]) {
        _tabName = [WXConvert NSString:value];
    } else if ([key isEqualToString:@"title"]) {
        _title = [WXConvert NSString:value];
    } else if ([key isEqualToString:@"unSelectedIcon"]) {
        _unSelectedIcon = [WXConvert NSString:value];
    } else if ([key isEqualToString:@"selectedIcon"]) {
        _selectedIcon = [WXConvert NSString:value];
    } else if ([key isEqualToString:@"message"]) {
        _message = [WXConvert NSInteger:value];
    } else if ([key isEqualToString:@"dot"]) {
        _dot = [WXConvert BOOL:value];
    }
}

@end
