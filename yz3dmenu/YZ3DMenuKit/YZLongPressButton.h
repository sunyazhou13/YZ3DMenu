//
//  YZLongPressButton.h
//  yz3dmenu
//
//  Created by sunyazhou on 2021/12/13.
//

#import <UIKit/UIKit.h>
#import "YZ3DMenuItem.h"
NS_ASSUME_NONNULL_BEGIN

typedef void(^YZLongPressButtonClickBlcok)(void);

@interface YZLongPressButton : UIView

@property (nonatomic,copy) NSString *imageName;
@property (nonatomic,copy) YZLongPressButtonClickBlcok tapAction;
@property (nonatomic,copy) NSArray <YZ3DMenuItem *> *menuItems;

@end

NS_ASSUME_NONNULL_END
