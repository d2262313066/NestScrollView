//
//  UIScrollView+MyScrollView.m
//  xx
//
//  Created by DahaoJiang on 2020/9/25.
//  Copyright © 2020 DahaoJiang. All rights reserved.
//

#import "UIScrollView+DHScrollView.h"
#import <objc/runtime.h>


@implementation UIScrollView (DHScrollView)

- (void)setShouldThrough:(NSString *)shouldThrough {
    objc_setAssociatedObject(self, "shouldThrough", shouldThrough, OBJC_ASSOCIATION_RETAIN);
}

- (NSString *)shouldThrough {
    return objc_getAssociatedObject(self, "shouldThrough");
}


- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {

    if ([self.shouldThrough isEqualToString:@"1"]) {
        return true;
    }
    
    return false;
}



@end

