//
//  YZ3DMenuAnimateLineContainerView.h
//  yz3dmenu
//
//  Created by sunyazhou on 2021/12/13.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YZ3DMenuAnimateLineContainerView : UIView
/** line color */
@property (nonatomic,strong) UIColor *lineColor;
/** animate */
- (void)lineAnimate;

@end

NS_ASSUME_NONNULL_END
