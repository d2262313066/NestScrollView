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

NS_ASSUME_NONNULL_END
