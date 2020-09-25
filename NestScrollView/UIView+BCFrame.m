//
//  UIView+Frame.m
//  DDBoxCreator
//
//  Created by DahaoJiang on 2020/8/12.
//  Copyright © 2020 DahaoJiang. All rights reserved.
//

#import "UIView+BCFrame.h"

@implementation UIView (BCFrame)

- (CGFloat)bc_left {
    return self.frame.origin.x;
}

- (void)setBc_left:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)bc_top {
    return self.frame.origin.y;
}

- (void)setBc_top:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)bc_right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setBc_right:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)bc_bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setBc_bottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)bc_width {
    return self.frame.size.width;
}

- (void)setBc_width:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)bc_height {
    return self.frame.size.height;
}

- (void)setBc_height:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGPoint)dd_center {
    return CGPointMake(self.frame.origin.x + self.frame.size.width * 0.5,
                       self.frame.origin.y + self.frame.size.height * 0.5);
}

- (void)setdd_center:(CGPoint)dd_center {
    CGRect frame = self.frame;
    frame.origin.x = dd_center.x - frame.size.width * 0.5;
    frame.origin.y = dd_center.y - frame.size.height * 0.5;
    self.frame = frame;
}

- (CGFloat)bc_centerX {
    return self.frame.origin.x + self.frame.size.width * 0.5;
}

- (void)setBc_centerX:(CGFloat)centerX {
    CGRect frame = self.frame;
    frame.origin.x = centerX - frame.size.width * 0.5;
    self.frame = frame;
}

- (CGFloat)bc_centerY {
    return self.frame.origin.y + self.frame.size.height * 0.5;
}

- (void)setBc_centerY:(CGFloat)centerY {
    CGRect frame = self.frame;
    frame.origin.y = centerY - frame.size.height * 0.5;
    self.frame = frame;
}

- (CGPoint)bc_origin {
    return self.frame.origin;
}

- (void)setBc_origin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGSize)frameSize {
    return self.frame.size;
}

- (void)setFrameSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

@end
