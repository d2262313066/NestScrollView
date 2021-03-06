//
//  ViewController.m
//  NestScrollView
//
//  Created by DahaoJiang on 2020/9/25.
//

#import "ViewController.h"
#import "PageTitleView.h"
#import "TBController.h"
#import "UIScrollView+DHScrollView.h"
@interface ViewController ()<TBControllerDelegate,UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollview1;

@property (nonatomic, strong) UIScrollView *scrollview2;

@property (nonatomic, strong) PageTitleView *titleView;

@property (nonatomic, strong) NSMutableArray *childVCArr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _childVCArr = [NSMutableArray array];
    
    _scrollview1 = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 88, self.view.frame.size.width, self.view.frame.size.height - 88)];
    _scrollview1.contentSize = CGSizeMake(0, 1000);
    _scrollview1.backgroundColor = [UIColor systemPinkColor];
    _scrollview1.tag = 500;
    _scrollview1.delegate = self;
    _scrollview1.shouldThrough = @"1";
    
    _titleView = [[PageTitleView alloc] initWithFrame:CGRectMake(0, 250, self.view.frame.size.width, 50) titles:@[@"标题1",@"标题2",@"标题3",@"标题4"]];
    _titleView.backgroundColor = [UIColor whiteColor];
    
    _scrollview2 = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 300, self.view.frame.size.width, 700)];
    _scrollview2.contentSize = CGSizeMake(self.view.frame.size.width * 4, 0);
    _scrollview2.backgroundColor = [UIColor blueColor];
    _scrollview2.tag = 501;
    _scrollview2.pagingEnabled = true;
    _scrollview2.delegate = self;
    
    [self.view addSubview:_scrollview1];
    [_scrollview1 addSubview:_titleView];
    [_scrollview1 addSubview:_scrollview2];
    
    for (int i = 0; i < 4; i ++) {
        TBController *tbvc = [[TBController alloc] init];
        tbvc.delegate = self;
        [self addChildViewController:tbvc];
        UIView *view = tbvc.view;
        CGRect rect = view.frame;
        rect.origin.x = self.view.frame.size.width * i;
        rect.size.height = _scrollview2.frame.size.height;
        view.frame = rect;
        [_scrollview2 addSubview:view];
        [_childVCArr addObject:tbvc];
    }
    
}


static CGFloat criticalOffset = 245;
#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView.tag == 500) {
        TBController *currentVc = self.childVCArr[_titleView.currentIndex];
        [self handleOutsideWithScrollView:_scrollview1 tableview:currentVc.tableView criticalOffset:245];

    } else if (scrollView.tag == 501) {
        [_titleView moveIndicatorViewWithOffset:_scrollview2.contentOffset.x];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (scrollView.tag == 501) {
        NSInteger index = scrollView.contentOffset.x / _scrollview2.frame.size.width;
        [_titleView selectCurrentTitleViewWithIndex:index];
    }
}



#pragma mark TaskListControllerDelegate
// 这里控制一下控制器内tableview返回的数值
- (void)controller:(UIViewController *)controller didScrollTableView:(UITableView *)tableView {
    [self handleInsideWithScrollView:_scrollview1 tableView:tableView criticalOffset:245];
}


#pragma mark - PageTitleViewDelegate
- (void)pageTitleIndicatorViewSelected:(NSInteger)index {
    //将scrollView滑动到指定地
    [_scrollview2 setContentOffset:CGPointMake(_scrollview2.frame.size.width * index, 0) animated:NO];
}

@end
