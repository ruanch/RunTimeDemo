//
//  NSObject+Property.m
//  RunTime
//
//  Created by 阮沧晖 on 2017/11/28.
//  Copyright © 2017年 阮沧晖. All rights reserved.
//

#import "NSObject+Property.h"

#import <objc/message.h>

static const char* key = "name";

@implementation NSObject(Property)



//属性
-(NSString *)name
{
    return objc_getAssociatedObject(self, key);
}

- (void) setName:(NSString *)name
{
    objc_setAssociatedObject(self, key, name, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
