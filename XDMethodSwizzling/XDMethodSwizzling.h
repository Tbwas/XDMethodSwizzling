//
//  XDMethodSwizzling.h
//
//  Created by xindong on 17/7/25.
//

#import <Foundation/Foundation.h>

@interface XDMethodSwizzling : NSObject

/**
 Call this method if you want to exchange the instance-method's implementation.
 
 @param originSelector origin selector.
 @param newSelector    new selector.
 @param currentClass   the instance's class, eg: [self class].
 */
+ (void)exchangeInstanceMethodWithOriginSelector:(SEL)originSelector newSelector:(SEL)newSelector class:(Class)currentClass;


/**
 Call this method if you want to exchange the class-method's implementation.

 @param originSelector origin selector.
 @param newSelector    new selector.
 @param currentClass   the class itself, eg: [self class].
 @Note The parameter `currentClass` should be the class which you wanna exchange method implementation, and we will help you to obtain the class's meta class via `isa`.
 */
+ (void)exchangeClassMethodWithOriginSelector:(SEL)originSelector newSelector:(SEL)newSelector class:(Class)currentClass;

@end
