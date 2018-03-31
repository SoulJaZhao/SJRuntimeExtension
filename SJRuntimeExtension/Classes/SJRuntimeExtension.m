//
//  SJRuntimeExtension.m
//  Pods
//
//  Created by SoulJa on 2018/3/31.
//

#import "SJRuntimeExtension.h"
#import <objc/message.h>

@implementation SJRuntimeExtension
#pragma mark - 获取成员变量列表
+ (NSArray *)ivarListWithObjcet:(NSObject *)obj {
    unsigned int count;
    
    Ivar *ivars = class_copyIvarList(obj.class, &count);
    
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i< count; i++) {
        Ivar ivar = ivars[i];
        const char *ivarName = ivar_getName(ivar);
        NSString *ivarNameStr = [[NSString alloc] initWithUTF8String:ivarName];
        [array addObject:ivarNameStr];
    }
    return array;
}

#pragma mark - 获取属性列表
+ (NSArray *)propertyListWithObject:(NSObject *)obj {
    unsigned int count;
    
    objc_property_t *propertyList = class_copyPropertyList(obj.class, &count);
    
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i < count; i++) {
        objc_property_t property = propertyList[i];
        const char *propertyName = property_getName(property);
        NSString *propertyNameStr = [[NSString alloc] initWithUTF8String:propertyName];
        [array addObject:propertyNameStr];
    }
    return array;
}
@end
