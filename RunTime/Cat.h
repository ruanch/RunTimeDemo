//
//  Cat.h
//  RunTime
//
//  Created by 阮沧晖 on 2017/11/28.
//  Copyright © 2017年 阮沧晖. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cat : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSInteger age;
@property (nonatomic, copy) NSString *city;
@property (nonatomic, copy) NSString *job;


- (instancetype)initWithNSDictionary:(NSDictionary *)dict;
@end
