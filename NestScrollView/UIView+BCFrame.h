//
//  UIView+Frame.h
//  DDBoxCreator
//
//  Created by DahaoJiang on 2020/8/12.
//  Copyright © 2020 DahaoJiang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (BCFrame)

@property (nonatomic) CGFloat bc_left;        ///< Shortcut for frame.origin.x.
@property (nonatomic) CGFloat bc_top;         ///< Shortcut for frame.origin.y
@property (nonatomic) CGFloat bc_right;       ///< Shortcut for frame.origin.x + frame.size.width
@property (nonatomic) CGFloat bc_bottom;      ///< Shortcut for frame.origin.y + frame.size.height
@property (nonatomic) CGFloat bc_width;       ///< Shortcut for frame.size.width.
@property (nonatomic) CGFloat bc_height;      ///< Shortcut for frame.size.height.
@property (nonatomic) CGFloat bc_centerX;     ///< Shortcut for center.x
@property (nonatomic) CGFloat bc_centerY;     ///< Shortcut for center.y
@property (nonatomic) CGPoint bc_origin;      ///< Shortcut for frame.origin.
@property (nonatomic, getter=frameSize, setter=setFrameSize:) CGSize  bc_size; ///< Shortcut for frame.size.

@end

NS_ASSUME_NONNULL_END
