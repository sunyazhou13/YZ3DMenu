//
//  YZ3DMenuDashboard.h
//  yz3dmenu
//
//  Created by sunyazhou on 2021/12/13.
//

#import <UIKit/UIKit.h>
#import "YZ3DMenuItem.h"
NS_ASSUME_NONNULL_BEGIN

@protocol YZ3DMenuDashboardDelegate <NSObject>

@optional
- (void)yz3dMenuDashboardSelectedIndex:(NSInteger)index;

@end

@interface YZ3DMenuDashboard : UIView

@property (nonatomic,copy) NSString *iconImageName; //中心图标image
@property (nonatomic,strong) UIGestureRecognizer *hostGesture; //当前触发的手势
@property (nonatomic,weak) id <YZ3DMenuDashboardDelegate> delegate;


+ (YZ3DMenuDashboard *)menuDashboardWithItemsArray:(NSArray<YZ3DMenuItem *> *)activityArray;

/// animate All item
- (void)animateAllItem;

@end

NS_ASSUME_NONNULL_END
