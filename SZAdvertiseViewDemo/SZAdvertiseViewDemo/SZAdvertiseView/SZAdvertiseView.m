//
//  SZAdvertiseView.m
//  BongDong
//
//  Created by styshy on 16/9/19.
//  Copyright © 2016年 styshy. All rights reserved.
//

#import "SZAdvertiseView.h"

/** 时间一般设置为3s，此处时间可以设置为0~9 */
static NSInteger countDownStartTime = 3;

@interface SZAdvertiseView()

@property(nonatomic, weak) UIImageView *logoImgView;
@property(nonatomic, weak) UIImageView *advertiseImgView;
@property(nonatomic, weak) UILabel *countDownLBL;
@property(nonatomic, strong) NSTimer *countTimer;
@end

@implementation SZAdvertiseView

- (void)awakeFromNib {
    [super awakeFromNib];
    [self addCustomView];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addCustomView];
    }
    return self;
}

- (void)addCustomView {
    self.backgroundColor = [UIColor whiteColor];

    UIImageView *advertiseImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds)*0.75)];
    [self addSubview:advertiseImgView];
    self.advertiseImgView = advertiseImgView;
    self.advertiseImgView.userInteractionEnabled =YES;
    UITapGestureRecognizer *advTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(advClick)];
    [self.advertiseImgView addGestureRecognizer:advTap];

    
    UIImageView *logoImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(advertiseImgView.frame), CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds)*0.25)];
    [self addSubview:logoImgView];
    self.logoImgView = logoImgView;
    self.logoImgView.userInteractionEnabled = YES;
    UITapGestureRecognizer *logoTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(logoClick)];
    [self.logoImgView addGestureRecognizer:logoTap];
    
    UIView *countDownView = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.bounds)- 80, 20, 60, 30)];
    [self addSubview:countDownView];
    countDownView.backgroundColor = [UIColor blackColor];
    countDownView.alpha = 0.3;
    countDownView.layer.cornerRadius = 5.0;
    UITapGestureRecognizer *countDownTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(countDownClick)];
    [countDownView addGestureRecognizer:countDownTap];
    
    UILabel *jumpLBL = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 45, 30)];
    jumpLBL.text = @"跳过";
    jumpLBL.textColor = [UIColor whiteColor];
    jumpLBL.textAlignment = NSTextAlignmentCenter;
    jumpLBL.userInteractionEnabled = YES;
    [countDownView addSubview:jumpLBL];

    UILabel *countDownLBL = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(jumpLBL.frame), 0, CGRectGetWidth(countDownView.bounds) - CGRectGetWidth(jumpLBL.bounds), 30)];
    countDownLBL.text = [NSString stringWithFormat:@"%zd",countDownStartTime];
    countDownLBL.textColor = [UIColor redColor];
    countDownLBL.textAlignment = NSTextAlignmentLeft;
    countDownLBL.userInteractionEnabled = YES;
    [countDownView addSubview:countDownLBL];
    self.countDownLBL = countDownLBL;
    
    NSTimer *countTimer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(changeCountDownTime) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:countTimer forMode:NSRunLoopCommonModes];
    self.countTimer = countTimer;
    [self.countTimer fire];
    
}

#pragma mark - Event Response 
-(void)advClick {
    if ([self.delegate respondsToSelector:@selector(advertiseClick:)]) {
        [self.delegate advertiseClick:self.advertiseType];
        [self stopTimer];
    }
}

- (void)logoClick {
    if ([self.delegate respondsToSelector:@selector(logoClick:)]) {
        [self.delegate logoClick:self.logoType];
        [self stopTimer];
    }
}

- (void)countDownClick {
    if ([self.delegate respondsToSelector:@selector(countDownClick)]) {
        [self.delegate countDownClick];
        [self stopTimer];
    }
}

- (void)changeCountDownTime {
    self.countDownLBL.text = [NSString stringWithFormat:@"%zd",countDownStartTime--];
    if (countDownStartTime == -1) {
        [self stopTimer];
        return;
    }
}

- (void)stopTimer {
    [self.countTimer invalidate];
    self.countTimer = nil;
    [UIView animateWithDuration:0.5 animations:^{
        self.alpha = 0.0;
    }completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];

}

#pragma mark - Setter方法
- (void)setAdvertiseImage:(UIImage *)advertiseImage {
    _advertiseImage = advertiseImage;
    self.advertiseImgView.image = advertiseImage;
}

- (void)setLogoImage:(UIImage *)logoImage {
    _logoImage = logoImage;
    self.logoImgView.image = logoImage;
}

@end
