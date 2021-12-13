//
//  YZConstantHeader.h
//  yz3dmenu
//
//  Created by sunyazhou on 2021/12/13.
//

#ifndef YZConstantHeader_h
#define YZConstantHeader_h

#define KTabbarItemNormalColor RGBCOLOR(97, 114, 130)
#define KTabbarMenuNormalColor RGBCOLOR(200, 200, 200)
// color
#define RGBCOLOR(r,g,b)    [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]

#define K_tabbar_height ([[UIApplication sharedApplication] statusBarFrame].size.height > 20 ? 83 : 49)
#define K_statusBar_height [UIApplication sharedApplication].statusBarFrame.size.height
static const CGFloat K_tabbar_response_height = 49;
static const CGFloat K_tabbar_safeArea_height = 34;
static const CGFloat K_navigationBar_content_height = 44;
#define K_Navibar_height (K_navigationBar_content_height + K_statusBar_height)

// screen width height
#define K_SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define K_SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#define K_3DMenu_WIDTH self.frame.size.width
#define K_3DMenu_HEIGHT self.frame.size.height
#define K_Activity_Count self.menuActivityArray.count

#define K_VIEW_WIDTH self.frame.size.width
static CGFloat KcycleMiniPercnet = 0.2;
static CGFloat KcycleMidPercent = 0.6;
static CGFloat KAnimateStep1Duration = 0.1;
static CGFloat KAnimateStep2Duration = 0.2;
static CGFloat KLineAnimateStep1Duration = 0.2;
static CGFloat KLineAnimateStep2Duration = 0.35;
static CGFloat KLineDleta = 3;
static CGFloat KImageLayerShowScale = 0.65;
static CGFloat KMinLineWH = 1.5;
#define KAnimateStep1Key @"KAnimateStep1Key"
#define KAnimateStep2Key @"KAnimateStep2Key"
#define KAnimateStep3Key @"KAnimateStep3Key"
#define KLineAnimateStep1Key @"KLineAnimateStep1Key"
#define KLineAnimateStep2Key @"KLineAnimateStep2Key"
#define KAnimateStopKey @"KAnimateStopKey"

// weakself strongself
#define COSWEAKSELF  __weak __typeof__(self) weakSelf = self;
#define COSSTRONGSELF __strong __typeof(self) strongSelf = weakSelf;
// auto scale num
#define KAUTOSCALE(num) ((K_SCREEN_WIDTH/375)*num)

#endif /* YZConstantHeader_h */
