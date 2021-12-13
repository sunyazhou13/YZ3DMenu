//
//  YZ3DMenuAnimateLineContainerView.m
//  yz3dmenu
//
//  Created by sunyazhou on 2021/12/13.
//

#import "YZ3DMenuAnimateLineContainerView.h"
#import "YZConstantHeader.h"

@interface YZ3DMenuAnimateLineContainerView () <CAAnimationDelegate>

@property (nonatomic,strong) NSMutableArray *lineArray;

@end

@implementation YZ3DMenuAnimateLineContainerView

#pragma mark - life cycle
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        for (int index = 0; index < 5; index++) {
            // line
            CAShapeLayer *line = [[CAShapeLayer alloc]init];
            [self.layer addSublayer:line];
            [self.lineArray addObject:line];
        }
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    for (int index = 0; index < self.lineArray.count; index++) {
        CAShapeLayer *line = self.lineArray[index];
        line.fillColor = self.lineColor.CGColor;
        line.transform = CATransform3DIdentity;
        line.anchorPoint = CGPointMake(0, 0.5);
        line.frame = CGRectMake(K_VIEW_WIDTH / 2, K_VIEW_WIDTH / 2, K_VIEW_WIDTH / 2, KMinLineWH);
        line.path = [UIBezierPath bezierPathWithRect:CGRectMake(KLineDleta, 0, K_VIEW_WIDTH / 2 - KLineDleta - 1, KMinLineWH)].CGPath;
        line.transform = CATransform3DMakeRotation(M_PI * 2 / 5 * index + M_PI_2, 0, 0, KMinLineWH);
    }
}

#pragma mark - delegates
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    CAShapeLayer *layer = self.lineArray.firstObject;
    if (anim == [layer animationForKey:KLineAnimateStep1Key]) {
        [self p_lineAlphaTranslateAnimate];
    }
    if (anim == [layer animationForKey:KLineAnimateStep2Key]) {
        self.hidden = YES;
        for (CAShapeLayer *line in self.lineArray) {
            [line removeAllAnimations];
            line.path = [UIBezierPath bezierPathWithRect:CGRectMake(KLineDleta, 0, K_VIEW_WIDTH / 2 - KLineDleta - 1, KMinLineWH)].CGPath;
        }
    }
}

#pragma mark - public methods
- (void)lineAnimate {
    for (int index = 0; index < self.lineArray.count; index++) {
        CAShapeLayer *line = self.lineArray[index];
        CABasicAnimation *lineAnimate = [CABasicAnimation animationWithKeyPath:@"path"];
        lineAnimate.fromValue = (id)[UIBezierPath bezierPathWithRect:CGRectMake(KLineDleta, 0, K_VIEW_WIDTH / 2 - KLineDleta - 1, KMinLineWH)].CGPath;
        lineAnimate.toValue = (id)[UIBezierPath bezierPathWithRect:CGRectMake(K_VIEW_WIDTH / 2 - KLineDleta - KMinLineWH, 0, KMinLineWH, KMinLineWH)].CGPath;
        lineAnimate.duration = KLineAnimateStep1Duration;
        lineAnimate.fillMode = kCAFillModeForwards;
        lineAnimate.removedOnCompletion = NO;
        lineAnimate.delegate = self;
        [line addAnimation:lineAnimate forKey:KLineAnimateStep1Key];
    }
}

#pragma mark - pravite methods
- (void)p_lineAlphaTranslateAnimate {
    for (int index = 0; index < self.lineArray.count; index++) {
        CAShapeLayer *line = self.lineArray[index];
        [line removeAllAnimations];
        CABasicAnimation *lineAnimate = [CABasicAnimation animationWithKeyPath:@"path"];
        lineAnimate.fromValue = (id)[UIBezierPath bezierPathWithRect:CGRectMake(K_VIEW_WIDTH / 2 - KLineDleta - 2, 0, KMinLineWH, KMinLineWH)].CGPath;
        lineAnimate.toValue = (id)[UIBezierPath bezierPathWithRect:CGRectMake(K_VIEW_WIDTH / 2 - KMinLineWH, 0, KMinLineWH, KMinLineWH)].CGPath;
        lineAnimate.duration = KLineAnimateStep2Duration;
        lineAnimate.fillMode = kCAFillModeForwards;
        lineAnimate.removedOnCompletion = NO;
        lineAnimate.delegate = self;
        [line addAnimation:lineAnimate forKey:KLineAnimateStep2Key];
    }
}

#pragma mark - setters
- (void)setLineColor:(UIColor *)lineColor {
    _lineColor = lineColor;
    [self.lineArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        CAShapeLayer *layer = (CAShapeLayer *)obj;
        layer.fillColor = self.lineColor.CGColor;
    }];
}

#pragma mark - getters
- (NSMutableArray *)lineArray {
    if (_lineArray == nil) {
        _lineArray = [NSMutableArray array];
    }
    return _lineArray;
}

@end
