//
//  YZ3DMenu.h
//  yz3dmenu
//
//  Created by sunyazhou on 2021/12/13.
//

#import <UIKit/UIKit.h>
#import "YZ3DMenuItem.h"
#import "YZ3DMenuDashboard.h"
NS_ASSUME_NONNULL_BEGIN

@interface YZ3DMenu : UIView
//所有子菜单项数组
@property (nonatomic,copy) NSArray <YZ3DMenuItem *> *menuItems;
//3D菜单仪表盘 corona menu
@property (nonatomic,strong) YZ3DMenuDashboard *coronaMenu;

/// 类方法初始化
/// @param menuItems 菜单项
+ (YZ3DMenu *)menuWithItemsArray:(NSArray<YZ3DMenuItem *> *)menuItems;

//显示菜单
- (void)show;
//收起菜单
- (void)disMiss;
@end

NS_ASSUME_NONNULL_END
