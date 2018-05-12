//
//  UIButton+Expend.m
//  buttonRange
//
//  Created by 战场原黑仪 on 2018/5/11.
//  Copyright © 2018年 战场原黑仪. All rights reserved.
//

#import "UIButton+Expend.h"

@implementation UIButton (Expend)

static char expandSizeKey;

/**
 OBJC_EXPORT void
 objc_setAssociatedObject(id _Nonnull object, const void * _Nonnull key,
 id _Nullable value, objc_AssociationPolicy policy)
 OBJC_AVAILABLE(10.6, 3.1, 9.0, 1.0, 2.0);
 OBJC_EXPORT 用来说明该接口是暴露给外界调用
 id  _Nonnull object             关联对象(最终获取值)  非空
 const void * _Nonnull key       关联键值
 id  _Nullable value             被关联对象(开始时的传入值)  非空
 objc_AssociationPolicy policy   
 OBJC_ASSOCIATION_ASSIGN = 0,
 OBJC_ASSOCIATION_RETAIN_NONATOMIC = 1,
 OBJC_ASSOCIATION_COPY_NONATOMIC = 3,
 OBJC_ASSOCIATION_RETAIN = 01401,
 OBJC_ASSOCIATION_COPY = 01403
 @param size 点击范围
 */
- (void)expandSize:(CGRect)size {
    objc_setAssociatedObject(self, &expandSizeKey, [NSValue valueWithCGRect:size], OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (CGRect)expandRect {
    
    NSValue *expandSize = objc_getAssociatedObject(self, &expandSizeKey);
    
    if (expandSize) {
        return CGRectMake(self.bounds.origin.x-expandSize.CGRectValue.size.width,
                          self.bounds.origin.y-expandSize.CGRectValue.size.height,
                          expandSize.CGRectValue.size.width*2,
                          expandSize.CGRectValue.size.height*2);
    } else {
        return self.bounds;
    }
}

//是否响应用户的点击事件
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {

    CGRect buttonRect = [self expandRect];
    if (CGRectEqualToRect(buttonRect, self.bounds)) {
        return [super pointInside:point withEvent:event];
    }
    return CGRectContainsPoint(buttonRect, point) ? YES : NO;
}

@end
