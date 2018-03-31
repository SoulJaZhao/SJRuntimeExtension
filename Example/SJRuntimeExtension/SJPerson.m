//
//  SJPerson.m
//  SJRuntimeExtension_Example
//
//  Created by SoulJa on 2018/3/31.
//  Copyright © 2018年 SoulJaZhao. All rights reserved.
//

#import "SJPerson.h"
#import "SJCar.h"
#import <objc/message.h>

@implementation SJPerson

- (void)run {
    NSLog(@"跑");
}

- (void)readWithContent:(NSString *)content {
    NSLog(@"读:%@",content);
}

#pragma mark - 消息发送
// 动态方法解析
+ (BOOL)resolveInstanceMethod:(SEL)sel {
    if (sel == @selector(instanceMethod)) {
        Class class = [self class];
        
        Method method = class_getInstanceMethod(class, @selector(resolveMethodIMP));
        // 添加方法
        class_addMethod(class, sel, method_getImplementation(method), method_getTypeEncoding(method));
        return YES;
    }
    return [super resolveInstanceMethod:sel];
}

- (void)resolveMethodIMP {
    NSLog(@"解救方法");
}

// 重定向
- (id)forwardingTargetForSelector:(SEL)aSelector {
    if (aSelector == @selector(personMethod)) {
        // 返回另外一个对象，让它去接收该消息
        SJCar *car = [[SJCar alloc] init];
        return car;
    }
    return [super forwardingTargetForSelector:aSelector];
}

// 消息转发
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    if (aSelector == @selector(personMethod2)) {
        NSMethodSignature *signature = [[SJCar new] methodSignatureForSelector:aSelector];
        return signature;
    }
    return [super methodSignatureForSelector:aSelector];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    if ([[SJCar new] respondsToSelector:anInvocation.selector]) {
        // 则让另一个对象来响应该方法
        [anInvocation invokeWithTarget:[SJCar new]];
    } else {
        [super forwardInvocation:anInvocation];
    }
}

@end
