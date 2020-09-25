//
//  BCPageTitleView.m
//  DDBoxCreator
//
//  Created by DahaoJiang on 2020/8/12.
//  Copyright © 2020 DahaoJiang. All rights reserved.
//

#import "PageTitleView.h"
#import "UIView+BCFrame.h"

#define m_Tag 10666

@interface PageTitleView ()

@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) UIView *indicaterView;

@property (nonatomic, assign) NSInteger buttonWidth;

@property (nonatomic, strong) NSMutableArray *buttons;

@end

@implementation PageTitleView

{
    //当前显示按钮的下标
    NSInteger _currentButtonIndex;
}
-(instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles
{
    if(self = [super initWithFrame:frame])
    {
        _buttons = [NSMutableArray array];
        _currentIndex = 0;
        [self createUI:titles];
    }
    return self;
}

- (void)createUI:(NSArray *)titles
{
    NSInteger avgCount = titles.count > 4 ?  4 : titles.count;
    _buttonWidth = BCPageScreen_W / avgCount;
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];

    self.scrollView.showsHorizontalScrollIndicator = NO;
    [self addSubview:self.scrollView];

    [self.scrollView setContentSize:CGSizeMake(titles.count * _buttonWidth, 0)];

    //创建按钮
    for (int i = 0; i < titles.count; i++)
    {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(_buttonWidth * i, 0, _buttonWidth, self.bc_height);
        [button setTitle:titles[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor orangeColor] forState:UIControlStateDisabled];
        [self.scrollView addSubview:button];
        [button addTarget:self action:@selector(titleHandle:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = m_Tag + i;
        [_buttons addObject:button];
        if(i == 0)
        {
            button.enabled = NO;
            _currentButtonIndex = i;
        }
    }

    //滑块
    _indicaterView = [[UIView alloc] initWithFrame:CGRectMake(0, self.bc_height - 2, _buttonWidth, 2)];
    _indicaterView.backgroundColor = [UIColor orangeColor];
    [_scrollView addSubview:_indicaterView];
}

-(void)titleHandle:(UIButton *)button
{
    [self selectCurrentTitleViewWithIndex:button.tag - m_Tag];
    
    _currentIndex = button.tag - m_Tag;

    //滑动指示器
    [UIView animateWithDuration:0.2 animations:^{
        self->_indicaterView.bc_centerX = button.bc_centerX;
    }];
    if([_delegate respondsToSelector:@selector(pageTitleIndicatorViewSelected:)])
    {
        [_delegate pageTitleIndicatorViewSelected:_currentButtonIndex];
    }

}

-(void)moveIndicatorViewWithOffset:(CGFloat)x
{
    //计算滑块偏移量
    CGFloat offsetX = (_buttonWidth * x) / BCPageScreen_W;
    self.indicaterView.bc_left = offsetX;
    _currentIndex = x/BCPageScreen_W;
    //设置scrollView的显示可见区域
    //设置setContentSize的值不能为0
//    [_scrollView scrollRectToVisible:_indicaterView.frame animated:YES];
   
    if (0) { //根据文字长短 显示indicator长短
        NSInteger selectIndex = x/BCPageScreen_W;

        UIButton *btn = _buttons[selectIndex];
        CGFloat textWidth = [btn.titleLabel.text boundingRectWithSize:CGSizeMake(200, 50) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil].size.width;
        
        CGRect indicatorRect = self.indicaterView.frame;
        indicatorRect.size.width = textWidth;
        self.indicaterView.frame = indicatorRect;
        self.indicaterView.bc_centerX = btn.bc_centerX;
    }


}

- (void)selectCurrentTitleViewWithIndex:(NSInteger)index
{

    //获取之前选中的按钮
    UIButton *oldBtn = [self.scrollView viewWithTag:m_Tag + _currentButtonIndex];
    oldBtn.enabled = YES;

    _currentButtonIndex = index;


    UIButton *currentButton = (UIButton *)[self.scrollView viewWithTag:m_Tag + index];
    currentButton.enabled = NO;

    //记录
    _currentButtonIndex = index;

    //将当前选中标题居中
    CGFloat offsetX = currentButton.center.x - BCPageScreen_W / 2;
    
    //判断左边
    if(offsetX < 0)
    {
        offsetX = 0 ;
    }
    //判断右边
    CGFloat maxOffSet = _scrollView.contentSize.width - _scrollView.bc_width;
    if(offsetX > maxOffSet)
    {
        offsetX = maxOffSet;
    }

    [_scrollView setContentOffset:CGPointMake(offsetX, 0) animated:YES];
    


}



@end
