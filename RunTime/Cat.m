//
//  Cat.m
//  RunTime
//
//  Created by 阮沧晖 on 2017/11/28.
//  Copyright © 2017年 阮沧晖. All rights reserved.
//

#import "Cat.h"

#import <objc/runtime.h>
@implementation Cat

- (instancetype)initWithNSDictionary:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
      
        [self perpareModel:dict];
        
    }
    
    return self;
}

- (void)perpareModel:(NSDictionary *)dict
{
    //储存本类的所有属性值
    NSMutableArray *keys = [NSMutableArray array];
    
    u_int count = 0;
    
   objc_property_t *properties = class_copyPropertyList([self class], &count);
    
    for (int i = 0; i < count ; i++)
    {
        objc_property_t property = properties[i];
        
        const char * propertyCString = property_getName(property);
        
        NSString *key = [NSString stringWithCString:propertyCString encoding:NSUTF8StringEncoding];
        
        [keys addObject:key];
    }
    free(properties);
    
    
    for (NSString *key in dict) {
        if ([dict valueForKey:key]) {
            //表示的意思是：对象Cat设置他的key的属性的值为当前类
            [self setValue:[dict valueForKey:key] forKey:key];
        }
    }
    
    
}

@end
