//
//  YZ3DMenuItem.m
//  yz3dmenu
//
//  Created by sunyazhou on 2021/12/13.
//

#import "YZ3DMenuItem.h"

@implementation YZ3DMenuItem

+ (YZ3DMenuItem *)itemWithTitle:(NSString *)title tintColor:(UIColor *)tintColor normalImage:(UIImage *)normalImage highLightImage:(UIImage *)hightLightImage selectAction:(YZ3DMenuSelectBlock)selectAction {
    YZ3DMenuItem *activity = [[YZ3DMenuItem alloc] init];
    activity.title = title;
    activity.normalImage = normalImage;
    activity.highLightImage = hightLightImage;
    activity.selectAction = selectAction;
    activity.titnColor = tintColor;
    return activity;
}

+ (YZ3DMenuItem *)itemWithTitle:(NSString *)title tintColor:(UIColor *)tintColor imageName:(NSString *)imageName normalColor:(UIColor *)normalColor highLightColor:(UIColor *)highLoghtColor selectionAction:(YZ3DMenuSelectBlock)selectAction{
    YZ3DMenuItem *activity = [[YZ3DMenuItem alloc] init];
    activity.title = title;
    activity.titnColor = tintColor;
    activity.normalImage = [[UIImage imageNamed:imageName] imageWithTintColor:normalColor];
    activity.highLightImage = [[UIImage imageNamed:imageName] imageWithTintColor:highLoghtColor];
    activity.selectAction = selectAction;
    return activity;
}
@end
