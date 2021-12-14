//
//  YZ3DMenu.m
//  yz3dmenu
//
//  Created by sunyazhou on 2021/12/13.
//

#import "YZ3DMenu.h"
#import "YZConstantHeader.h"

#define kYZMenuDismissDuration 0.3
@interface YZ3DMenu ()

@property (nonatomic,strong) UIWindow *window;
@property (nonatomic,strong) UIVisualEffectView *blurView;

@end

@implementation YZ3DMenu

#pragma mark - public methods
+ (YZ3DMenu *)menuWithItemsArray:(NSArray<YZ3DMenuItem *> *)menuItems {
    // create menu
    YZ3DMenu *menu = [[YZ3DMenu alloc] init];
    menu.menuItems = menuItems;
//    universalMenu.coronaMenu.isCustomThemeColor = YES;
    menu.coronaMenu.backgroundColor = RGBCOLOR(217, 62, 69);
    menu.coronaMenu.iconImageName = @"tabbar_icon_post";
    // create window
    UIWindow *menuBgWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    menu.window = menuBgWindow;
    UIViewController *tempRootViewController = [[UIViewController alloc]init];
    tempRootViewController.view.userInteractionEnabled = NO;
    menuBgWindow.rootViewController = tempRootViewController;
    menuBgWindow.userInteractionEnabled = YES;
    menuBgWindow.windowLevel = UIWindowLevelStatusBar;
    // add blur
    UIVisualEffectView *blurView = [[UIVisualEffectView alloc]initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleDark]];
    blurView.frame = [UIScreen mainScreen].bounds;
    [menuBgWindow addSubview:blurView];
    menu.blurView = blurView;
    blurView.alpha = 0;
    blurView.layer.zPosition = -1000;
    // add mebu
    [menuBgWindow addSubview:menu];
    menu.frame = [UIScreen mainScreen].bounds;
    return menu;
}

- (void)show {
    self.window.hidden = NO;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.coronaMenu.hidden = NO;
        self.coronaMenu.transform = CGAffineTransformMakeScale(0.01, 0.01);
        [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:20 options:UIViewAnimationOptionCurveEaseIn animations:^{
            [self.coronaMenu animateAllItem];
            self.blurView.alpha = 0.8;
            self.coronaMenu.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
        }];
    });
}

- (void)disMiss {
    [UIView animateWithDuration:kYZMenuDismissDuration animations:^{
        self.blurView.alpha = 0;
        self.coronaMenu.transform = CGAffineTransformMakeScale(0.01, 0.01);
    } completion:^(BOOL finished) {
        self.window.hidden = YES;
        self.window = nil;
    }];
}

#pragma mark - getters
- (void)setMenuItems:(NSArray<YZ3DMenuItem *> *)menuItems {
    _menuItems = menuItems;
    self.coronaMenu = [YZ3DMenuDashboard menuDashboardWithItemsArray:menuItems];
    self.coronaMenu.delegate = self;
    // add subview
    [self addSubview:self.coronaMenu];
    
    CGFloat fitIos11Height = (K_tabbar_height - K_tabbar_response_height);
    self.coronaMenu.center = CGPointMake(K_SCREEN_WIDTH/2, K_SCREEN_HEIGHT - K_tabbar_response_height/2 - fitIos11Height);
    self.coronaMenu.bounds = CGRectMake(0, 0, KAUTOSCALE(250), KAUTOSCALE(250));
    self.coronaMenu.hidden = YES;
}

@end
