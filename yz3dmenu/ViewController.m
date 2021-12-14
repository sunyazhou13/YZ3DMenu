//
//  ViewController.m
//  yz3dmenu
//
//  Created by sunyazhou on 2021/12/13.
//

#import "ViewController.h"

//#import "YZ3DMenuKit/YZLongPressButton.h"
//#import "YZ3DMenuKit/YZ3DMenuItem.h"

#import "YZ3DMenuKit/YZ3DMenuKit.h"
#import <Masonry/Masonry.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    YZ3DMenuItem *nightItem = [YZ3DMenuItem itemWithTitle:@"切换暗色/亮色"
                                                tintColor:KTabbarMenuNormalColor
                                                imageName:@"menu_night_moon"
                                              normalColor:KTabbarMenuNormalColor
                                           highLightColor:[UIColor whiteColor] selectionAction:^{
        NSLog(@"暗色切换");
    }];
    YZ3DMenuItem *settingItem = [YZ3DMenuItem itemWithTitle:@"设置"
                                                tintColor:KTabbarMenuNormalColor
                                                imageName:@"menu_setting"
                                              normalColor:KTabbarMenuNormalColor
                                           highLightColor:[UIColor whiteColor] selectionAction:^{
        NSLog(@"设置");
    }];
    YZ3DMenuItem *moreItem = [YZ3DMenuItem itemWithTitle:@"更多选项"
                                                tintColor:KTabbarMenuNormalColor
                                                imageName:@"menu_more"
                                              normalColor:KTabbarMenuNormalColor
                                           highLightColor:[UIColor whiteColor] selectionAction:^{
        NSLog(@"更多选项");
    }];
    YZ3DMenuItem *likeItem = [YZ3DMenuItem itemWithTitle:@"收藏"
                                                tintColor:KTabbarMenuNormalColor
                                                imageName:@"menu_star"
                                              normalColor:KTabbarMenuNormalColor
                                           highLightColor:[UIColor whiteColor] selectionAction:^{
        NSLog(@"收藏");
    }];
    YZ3DMenuItem *searchItem = [YZ3DMenuItem itemWithTitle:@"热门搜索"
                                                tintColor:KTabbarMenuNormalColor
                                                imageName:@"menu_search"
                                              normalColor:KTabbarMenuNormalColor
                                           highLightColor:[UIColor whiteColor] selectionAction:^{
        NSLog(@"热门搜索");
    }];
    NSArray <YZ3DMenuItem *> *items = @[nightItem,settingItem,moreItem,likeItem,searchItem];
     
    YZLongPressButton *menuButton = [[YZLongPressButton alloc] init];
    menuButton.imageName = @"tabbar_icon_post";
    menuButton.menuItems = [items copy];
    menuButton.tapAction = ^{
        NSLog(@"长按触发");
    };
    [self.view addSubview:menuButton];
    [menuButton mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(64, 49));
        make.bottom.mas_equalTo(self.view.safeAreaInsets.bottom).offset(0);
    }];
}


@end
