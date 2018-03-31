//
//  SJRuntimeExtension.h
//  Pods
//
//  Created by SoulJa on 2018/3/31.
//

#import <Foundation/Foundation.h>

@interface SJRuntimeExtension : NSObject
// 获取成员属性列表
+ (NSArray *)ivarListWithObjcet:(NSObject *)obj;

// 获取属性列表
+ (NSArray *)propertyListWithObject:(NSObject *)obj;


@end
