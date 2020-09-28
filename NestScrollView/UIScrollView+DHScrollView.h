//
//  UIScrollView+MyScrollView.h
//  xx
//
//  Created by DahaoJiang on 2020/9/25.
//  Copyright © 2020 DahaoJiang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIScrollView (DHScrollView) <UIGestureRecognizerDelegate>

/// 手势穿透
@property (nonatomic, strong) NSString *shouldThrough;

@end

/**
    用法 打开外部scrollview的穿透 在scrollviewdidscroll的地方 外部scrollview调用外部的方法，tableview调用内部的方法
 */

@interface UIViewController (HandleNest)

// 处理内部tableView的滚动
- (void)handleInsideWithScrollView:(UIScrollView *)scrollView tableView:(UITableView *)tableView criticalOffset:(CGFloat)criticalOffset;

/// 处理外部scrollview的偏移量
- (void)handleOutsideWithScrollView:(UIScrollView *)scrollView tableview:(UITableView *)tableView criticalOffset:(CGFloat)criticalOffset;
@end

NS_ASSUME_NONNULL_END
