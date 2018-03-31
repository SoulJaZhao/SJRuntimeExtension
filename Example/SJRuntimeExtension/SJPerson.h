//
//  SJPerson.h
//  SJRuntimeExtension_Example
//
//  Created by SoulJa on 2018/3/31.
//  Copyright © 2018年 SoulJaZhao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SJPerson : NSObject {
    NSString *_name;
    NSInteger _age;
    CGFloat _height;
}

@property (nonatomic,copy) NSString *address;
@property (nonatomic,assign) CGFloat score;

- (void)run;

- (void)readWithContent:(NSString *)content;

- (void)instanceMethod;

- (void)personMethod;

- (void)personMethod2;
@end
