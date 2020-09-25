//
//  BCPageTitleView.h
//  DDBoxCreator
//
//  Created by DahaoJiang on 2020/8/12.
//  Copyright © 2020 DahaoJiang. All rights reserved.
//

#import <UIKit/UIKit.h>

#define BCPageBtnWidth 70

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)

#define BCPageScreen_W SCREEN_WIDTH
#define BCPageScreen_H SCREEN_HEIGHT

NS_ASSUME_NONNULL_BEGIN

@protocol PageTitleViewDelegate <NSObject>

- (void)pageTitleIndicatorViewSelected:(NSInteger)index;

@end

@interface PageTitleView : UIView

@property (nonatomic, assign) NSInteger currentIndex;

@property (nonatomic, weak) id<PageTitleViewDelegate> delegate;

- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles;

//移动滑块
- (void)moveIndicatorViewWithOffset:(CGFloat)x;

- (void)selectCurrentTitleViewWithIndex:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END
