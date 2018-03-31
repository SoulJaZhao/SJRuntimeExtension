//
//  SJCar+SJRuntimeExtension.m
//  SJRuntimeExtension_Example
//
//  Created by SoulJa on 2018/3/31.
//  Copyright © 2018年 SoulJaZhao. All rights reserved.
//

#import "SJCar+SJRuntimeExtension.h"
#import <objc/message.h>

const void *key = @"speed";

@implementation SJCar (SJRuntimeExtension)
- (void)setSpeed:(NSString *)speed {
    objc_setAssociatedObject(self, key, speed, OBJC_ASSOCIATION_COPY);
}


- (NSString *)speed {
    return objc_getAssociatedObject(self, key);
}
@end
