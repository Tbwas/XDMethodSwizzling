//
//  XDMethodSwizzling.m
//
//  Created by xindong on 17/7/25.
//

#import "XDMethodSwizzling.h"
#import <objc/runtime.h>

@implementation XDMethodSwizzling

#pragma mark - Private

+ (void)xd_startExchangeImplementationOriginMethod:(Method)methodOrigin newMethod:(Method)methodNew originSelector:(SEL)selectorOrigin newSelector:(SEL)selectorNew class:(Class)realClass {
    
    IMP impOrigin = method_getImplementation(methodOrigin);
    IMP impNew = method_getImplementation(methodNew);
    
    BOOL isAdd = class_addMethod(realClass, selectorOrigin, impNew, method_getTypeEncoding(methodNew));
    if (isAdd) {
        class_addMethod(realClass, selectorNew, impOrigin, method_getTypeEncoding(methodOrigin));
    } else {
        method_exchangeImplementations(methodOrigin, methodNew);
    }
}

#pragma mark - Public

+ (void)exchangeInstanceMethodWithOriginSelector:(SEL)originSelector newSelector:(SEL)newSelector class:(Class)currentClass {
    
    BOOL condition = originSelector && newSelector && currentClass;
    NSAssert(condition, @"the selectors and currentClass cann't be nil.");
    
    Class realClass = object_getClass(currentClass);
    
    Method methodOrigin = class_getInstanceMethod(realClass, originSelector);
    Method methodNew = class_getInstanceMethod(realClass, newSelector);
    
    [self xd_startExchangeImplementationOriginMethod:methodOrigin newMethod:methodNew originSelector:originSelector newSelector:newSelector class:realClass];
}

+ (void)exchangeClassMethodWithOriginSelector:(SEL)originSelector newSelector:(SEL)newSelector class:(Class)currentClass {
    
    BOOL condition = originSelector && newSelector && currentClass;
    NSAssert(condition, @"the selectors and currentClass cann't be nil.");

    Class realClass = object_getClass(currentClass);
    Method methodOrigin = class_getClassMethod(realClass, originSelector);
    Method methodNew = class_getClassMethod(realClass, newSelector);
    
    [self xd_startExchangeImplementationOriginMethod:methodOrigin newMethod:methodNew originSelector:originSelector newSelector:newSelector class:realClass];
}


@end
