//
//  Person.m
//  RunTime
//
//  Created by 阮沧晖 on 2017/11/28.
//  Copyright © 2017年 阮沧晖. All rights reserved.
//

#import "Person.h"
#import <objc/runtime.h>

#import "NSObject+Property.h"

@implementation Person

//方法
void eat(id self,SEL sel)
{
    NSLog(@"%@%@",self,NSStringFromSelector(sel));
}

void callPhone(id self,SEL sel,NSString *phone)
{
    NSLog(@"打电话给:%@",phone);
}

+(BOOL)resolveInstanceMethod:(SEL)sel
{
    if (sel == @selector(eat)) {
        class_addMethod(self, @selector(eat), eat, "v@:");
    }else if (sel == @selector(callPhone)){
        class_addMethod(self, @selector(callPhone), callPhone, "v@:@");
    }
    
    return [super resolveClassMethod:sel];
}



-(void)printName
{
    NSLog(@"%@",self.name);
}

@end

