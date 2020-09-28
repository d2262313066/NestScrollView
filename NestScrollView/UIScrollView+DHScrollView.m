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


@implementation UIViewController (HandleNest)

// 处理内部tableView的滚动
- (void)handleInsideWithScrollView:(UIScrollView *)scrollView tableView:(UITableView *)tableView criticalOffset:(CGFloat)criticalOffset {
    if (scrollView.contentOffset.y < criticalOffset) {
        // 禁止滚动 && 自动滚到最上
        tableView.contentOffset = CGPointMake(0, 0);
    } else if (scrollView.contentOffset.y >= criticalOffset) {
        if (tableView.contentOffset.y < 0) {
            tableView.contentOffset = CGPointMake(0, 0);
        }
    }
}

/// 处理外部scrollview的偏移量
- (void)handleOutsideWithScrollView:(UIScrollView *)scrollView tableview:(UITableView *)tableView criticalOffset:(CGFloat)criticalOffset {
    // 临界偏移量   小于的话不允许下方滚动
    // 这个scrollview把属性穿透打开了，所以要自己控制一下偏移量
    if (scrollView.contentOffset.y < criticalOffset) {
        // 如果当前显示tablview的偏移量大于0, 则固定scrollview,让tableview滚动完再移动scrollview的
        if (tableView.contentOffset.y > 0) {
            scrollView.contentOffset = CGPointMake(0, criticalOffset);
        } else {
            tableView.contentOffset = CGPointMake(0, 0);
        }
    } else if (scrollView.contentOffset.y >= criticalOffset) {
        //contentoffset-y 如果小于0 静止滚动
        scrollView.contentOffset = CGPointMake(0, criticalOffset);
        if (tableView.contentOffset.y < 0) {
            tableView.contentOffset = CGPointMake(0, 0);
        } else {
            
        }
    }
}

@end


