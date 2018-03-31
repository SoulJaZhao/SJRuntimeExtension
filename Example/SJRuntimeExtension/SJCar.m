//
//  SJCar.m
//  SJRuntimeExtension_Example
//
//  Created by SoulJa on 2018/3/31.
//  Copyright © 2018年 SoulJaZhao. All rights reserved.
//

#import "SJCar.h"
#import <objc/message.h>

@implementation SJCar
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        
        SEL oriSEL = @selector(drive);
        SEL swiSEL = @selector(sj_drive);
        
        Method oriMethod = class_getInstanceMethod(class, oriSEL);
        Method swiMethod = class_getInstanceMethod(class, swiSEL);
        
        BOOL didAddMethod = class_addMethod(class, oriSEL, method_getImplementation(swiMethod), method_getTypeEncoding(swiMethod));
        
        if (didAddMethod) {
            class_replaceMethod(class, swiSEL, method_getImplementation(oriMethod), method_getTypeEncoding(oriMethod));
        } else {
            method_exchangeImplementations(oriMethod, swiMethod);
        }
    });
}

- (void)personMethod {
    NSLog(@"车执行了人的方法");
}

- (void)personMethod2 {
    NSLog(@"车执行了人的方法2");
}

- (void)drive {
    
}

- (void)sj_drive {
    NSLog(@"sj_drive");
}
@end
