//
//  YZ3DMenuItem.h
//  yz3dmenu
//
//  Created by sunyazhou on 2021/12/13.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^YZ3DMenuSelectBlock) (void);

@interface YZ3DMenuItem : NSObject
// property
@property (nonatomic,copy) NSString *title;
@property (nonatomic,strong) UIColor *titnColor;
@property (nonatomic,strong) UIImage *normalImage;
@property (nonatomic,strong) UIImage *highLightImage;
@property (nonatomic,copy) YZ3DMenuSelectBlock selectAction;

/**
 initial method

 @param title title
 @param imageName imageName
 @param normalColor normal image color
 @param highLoghtColor highligt image color
 @param selectAction selct action
 @return YZ3DMenuItem
 */
+ (YZ3DMenuItem *)itemWithTitle:(NSString *)title
                      tintColor:(UIColor *)tintColor
                      imageName:(NSString *)imageName
                    normalColor:(UIColor *)normalColor
                 highLightColor:(UIColor *)highLoghtColor
                selectionAction:(YZ3DMenuSelectBlock)selectAction;
/**
 initial method

 @param title title
 @param normalImage normal image
 @param hightLightImage hightlight(selcted) image
 @param selectAction select action
 @return YZ3DMenuItem
 */

+ (YZ3DMenuItem *)itemWithTitle:(NSString *)title
                      tintColor:(UIColor *)tintColor
                    normalImage:(UIImage *)normalImage
                 highLightImage:(UIImage *)hightLightImage
                   selectAction:(YZ3DMenuSelectBlock)selectAction;
@end

NS_ASSUME_NONNULL_END
