//
//  YZLongPressButton.m
//  yz3dmenu
//
//  Created by sunyazhou on 2021/12/13.
//

#import "YZLongPressButton.h"
#import "YZ3DMenu.h"
#import "UIView+YZ3DAddition.h"
#import "YZConstantHeader.h"

static const CGFloat KLongPressMinTime = 0.3;

@interface YZLongPressButton ()

@property (nonatomic,strong) UIImageView *iconImageView;
@property (nonatomic,strong) YZ3DMenu *mainMenu;

@end

@implementation YZLongPressButton
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.iconImageView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.iconImageView.center = CGPointMake(self.width/2, self.height/2);
    self.iconImageView.bounds = CGRectMake(0, 0, 40, 40);
    self.iconImageView.layer.cornerRadius = 20;
//    self.iconImageView.isCustomThemeColor = YES;
    self.iconImageView.backgroundColor = RGBCOLOR(217, 62, 69);
    self.iconImageView.image = [UIImage imageNamed:self.imageName];
    // tap gesture
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
    [self addGestureRecognizer:tapGesture];
    // long press gesture
    UILongPressGestureRecognizer *longPressGesture = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPressAction:)];
    longPressGesture.minimumPressDuration = KLongPressMinTime;
    [self addGestureRecognizer:longPressGesture];
    // dealing gesture relationship
    [tapGesture requireGestureRecognizerToFail:longPressGesture];
}

#pragma mark - target action
- (void)tapAction:(UITapGestureRecognizer *)tapGesture {
    if (self.tapAction) {
        self.tapAction();
    }
}

- (void)longPressAction:(UILongPressGestureRecognizer *)longPressGesture {
    switch (longPressGesture.state) {
        case UIGestureRecognizerStateBegan:
        {
            self.mainMenu = [YZ3DMenu menuWithItemsArray:self.menuItems];
            [self.mainMenu show];
        }
            break;
        case UIGestureRecognizerStateChanged:
        {
            self.mainMenu.coronaMenu.hostGesture = longPressGesture;
        }
            break;
        case UIGestureRecognizerStateFailed:
        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateEnded:
        {
            [self.mainMenu disMiss];
            self.mainMenu.coronaMenu.hostGesture = longPressGesture;
        }
            break;
        default:
            break;
    }
}

#pragma mark - getters
- (UIImageView *)iconImageView {
    if (_iconImageView == nil) {
        _iconImageView = [[UIImageView alloc]init];
        _iconImageView.contentMode = UIViewContentModeCenter;
    }
    return _iconImageView;
}

@end
