//
//  YZ3DMenuItemButton.h
//  yz3dmenu
//
//  Created by sunyazhou on 2021/12/13.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^zhnActionBlcok)(void);
@interface YZ3DMenuItemButton : UIView
/**
 default 'NO'. if 'YES' click the button animate everytime , else animate once time if you want animate one more time you need call '- (void)clearHightLight;' method first.
 */
@property (nonatomic,assign) BOOL isNeedAnimateEverytime;

/**
 default 'YES' means need deal click actions
 */
@property (nonatomic,assign) BOOL isNeedDealingActions;

/**
 default 'NO' , While `No` if hightlight click btn it will not become normal, if `YES` it will.
 */
@property (nonatomic,assign) BOOL isCycleResponse;

/**
 unconventional to change button image
 */
@property (nonatomic,strong) UIImage *unconventionalImage;

/**
 instance method

 @param tintColor tint color
 @param normalImage normal image
 @param hightLightImage hightlight image
 @param normalAction normal showing tap button action
 @param hightLightAction hightlight showing tap button aciton
 @return instance
 */
+ (instancetype)yz3dItemButtonWithTintColor:(UIColor *)tintColor
                                 normalImage:(UIImage *)normalImage
                             hightLightImage:(UIImage *)hightLightImage
                         normalTypeTapAction:(zhnActionBlcok)normalAction
                     hightLightTypeTapAction:(zhnActionBlcok)hightLightAction;


/** clear hightlight status */
- (void)clearHightLight;
/** animation to hightlight */
- (void)animateHightLight;
/** no animation to hightlight */
- (void)noAnimationHgihtLight;

/**
 If u want change the image or tint color. such as change color theme. It will not change the current showing image

 @param normalImage normal image
 @param hightLightImage hightlight image
 @param tintColor tint color
 */
- (void)reloadStateWithNormalImage:(UIImage *)normalImage
                   hightlightImage:(UIImage *)hightLightImage
                         tintColor:(UIColor *)tintColor;


/**
 Change the image or tint color. such as change color theme. It will change the current showing image

 @param normalImage normal type image
 @param hightLightImage hightlight type image
 @param showingImage current showing image
 @param tintColor tint color
 */
- (void)reloadStateWithNormalImage:(UIImage *)normalImage
                   hightlightImage:(UIImage *)hightLightImage
                      showingImage:(UIImage *)showingImage
                         tintColor:(UIColor *)tintColor;
@end

NS_ASSUME_NONNULL_END
