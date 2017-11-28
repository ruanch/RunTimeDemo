//
//  UIImage+Image.m
//  RunTime
//
//  Created by 阮沧晖 on 2017/11/28.
//  Copyright © 2017年 阮沧晖. All rights reserved.
//

#import "UIImage+Image.h"
#import <objc/runtime.h>
@implementation UIImage(Image)
+ (void)load
{
    Method m1 = class_getClassMethod([self class], @selector(imageNamed:));
    Method m2 = class_getClassMethod([self class], @selector(imageWithName:));
    
    method_exchangeImplementations(m1, m2);
}

+ (instancetype)imageWithName:(NSString *)name
{
    UIImage *image = [self imageWithName:name];
    
    if (image == nil) {
        NSLog(@"加载一张空白的图");
    }
    
    return image;
}
@end
