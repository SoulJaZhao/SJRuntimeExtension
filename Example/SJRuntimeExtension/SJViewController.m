//
//  SJViewController.m
//  SJRuntimeExtension
//
//  Created by SoulJaZhao on 03/31/2018.
//  Copyright (c) 2018 SoulJaZhao. All rights reserved.
//
/**
 Runtime常用操作示例
 1.消息发送机制
 2.利用消息发送机制动态添加方法 动态方法解析 重定向 消息转发
 3.获取成员变量列表
 4.获取属性列表
 5.动态添加属性
 6.交换方法
 */

#import "SJViewController.h"
#import "SJPerson.h"
#import "SJCar.h"
#import "SJCar+SJRuntimeExtension.h"
#import <objc/message.h>
#import <SJRuntimeExtension/SJRuntimeExtension.h>

@interface SJViewController ()

@end

@implementation SJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// 1.实现消息转发
    SJPerson *person = [[SJPerson alloc] init];
    // 发送不带参数的方法
    objc_msgSend(person, @selector(run));
    // 发送带参数的方法
    objc_msgSend(person, @selector(readWithContent:),@"Hello World!");
    
    // 2.消息转发
    // 动态方法解析
    [person performSelector:@selector(instanceMethod)];
    // 重定向
    [person performSelector:@selector(personMethod)];
    // 消息转发
    [person performSelector:@selector(personMethod2)];
    
    // 3.获取成员变量列表
    NSArray *ivarList = [SJRuntimeExtension ivarListWithObjcet:person];
    NSLog(@"person的成员变量列表为:%@",ivarList);
    
    // 4.获取属性列表
    NSArray *propertyList = [SJRuntimeExtension propertyListWithObject:person];
    NSLog(@"person的属性列表为:%@",propertyList);
    
    // 5.动态添加属性
    SJCar *car = [[SJCar alloc] init];
    car.speed = @"40";
    NSLog(@"car添加了speed属性:%@",car.speed);
    
    [car drive];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
