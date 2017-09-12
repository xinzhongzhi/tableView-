//
//  xzzModel.m
//  TB优化新版(辛小二)
//
//  Created by 辛忠志 on 2017/9/11.
//  Copyright © 2017年 TB优化新版(辛小二). All rights reserved.
//

#import "xzzModel.h"

@implementation xzzModel


- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = super.init;
    if (self) {
        _identifier = [self uniqueIdentifier];
        _title = dictionary[@"title"];
        _content = dictionary[@"content"];
        _username = dictionary[@"username"];
        _time = dictionary[@"time"];
        _imageName = dictionary[@"imageName"];
    }
    return self;
}

- (NSString *)uniqueIdentifier
{
    static NSInteger counter = 0;
    return [NSString stringWithFormat:@"unique-id-%@", @(counter++)];
}

@end
