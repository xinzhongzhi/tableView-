//
//  xzzModel.h
//  TB优化新版(辛小二)
//
//  Created by 辛忠志 on 2017/9/11.
//  Copyright © 2017年 TB优化新版(辛小二). All rights reserved.
//

#import <Foundation/Foundation.h>

@interface xzzModel : NSObject
/*初始化方法*/
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@property (nonatomic, copy, readonly) NSString *identifier;
@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, copy, readonly) NSString *content;
@property (nonatomic, copy, readonly) NSString *username;
@property (nonatomic, copy, readonly) NSString *time;
@property (nonatomic, copy, readonly) NSString *imageName;
@end
