//
//  TBController.h
//  NestScrollView
//
//  Created by DahaoJiang on 2020/9/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol TBControllerDelegate <NSObject>

- (void)controller:(UIViewController *)controller didScrollTableView:(UITableView *)tableView;

@end


@interface TBController : UIViewController

@property (nonatomic, assign) id<TBControllerDelegate> delegate;

@property (nonatomic, strong) UITableView *tableView;

@end

NS_ASSUME_NONNULL_END
