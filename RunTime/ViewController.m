//
//  ViewController.m
//  RunTime
//
//  Created by 阮沧晖 on 2017/11/24.
//  Copyright © 2017年 阮沧晖. All rights reserved.
//

#import "ViewController.h"

#import "Person.h"

#import "NSObject+Property.h"

#import <objc/runtime.h>

#import "Cat.h"

#import "UIImage+Image.h"
@interface ViewController ()

@property (nonatomic, strong)NSString *name;
@property (nonatomic, strong)NSString *age;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
/***
    unsigned int count;
    //获取属性列表
    objc_property_t *propertyList = class_copyPropertyList([self class], &count);
    for (unsigned int i=0; i<count; i++) {
        const char *propertyName = property_getName(propertyList[i]);
        NSLog(@"property---->%@", [NSString stringWithUTF8String:propertyName]);
    }

*/
    /**
    unsigned int count;
    //获取方法列表
    Method *methodList = class_copyMethodList([self class], &count);
    for (unsigned int i = 0; i<count; i++) {
        Method method = methodList[i];
        NSLog(@"method---->%@", NSStringFromSelector(method_getName(method)));
    }
    
    
    //获取成员变量列表
    Ivar *ivarList = class_copyIvarList([self class], &count);
    for (unsigned int i = 0; i<count; i++) {
        Ivar myIvar = ivarList[i];
        const char *ivarName = ivar_getName(myIvar);
        NSLog(@"Ivar---->%@", [NSString stringWithUTF8String:ivarName]);
    }
     */
    
    
    //动态添加方法，如果类比较大的时候可以运态添加，增加运行速度
    Person *p = [[Person alloc] init];
    //[p performSelector:@selector(callPhone)];
    [p performSelector:@selector(eat)];
    [p performSelector:@selector(callPhone) withObject:@"hello jok"];
    
    
    //用动态方式添加一个动态的属性
    p.name = @"lucy";
    NSLog(@"%@",p.name);
    
    //添加动态属性后又在本身的类中实现一个方法去调用name的属性
    p.name = @"tom";
    [p performSelector:@selector(printName)];
    
    
    //字典转模型
    NSDictionary *dict = @{@"name":@"tom",@"age":@20,@"city":@"上海",@"job":@"一只猫"};
    Cat *c = [[Cat alloc] initWithNSDictionary:dict];
    NSLog(@"字典转模型:%@-%ld-%@-%@",c.name,(long)c.age,c.city,c.job);
    
    //kvc字典转模型
    Cat *kvcCat = [[Cat alloc] init];
    [kvcCat setValuesForKeysWithDictionary:dict];
    NSLog(@"字典转模型:%@-%ld-%@-%@",c.name,(long)c.age,c.city,c.job);
    
    //交换方法
    UIImage *image = [UIImage imageNamed:@"123"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
