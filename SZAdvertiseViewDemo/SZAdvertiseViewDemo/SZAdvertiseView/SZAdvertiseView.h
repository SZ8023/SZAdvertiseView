//
//  SZAdvertiseView.h
//  BongDong
//
//  Created by styshy on 16/9/19.
//  Copyright © 2016年 styshy. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SZAdvertiseView;

@protocol SZAdvertiseViewDelegate <NSObject>

- (void)advertiseClick:(NSString *)advType;

- (void)logoClick:(NSString *)logoType;

- (void)countDownClick;

@end

@interface SZAdvertiseView : UIView

/** 广告图片 */
@property(nonatomic, strong) UIImage *advertiseImage;
/** 判断跳转到什么地方 */
@property(nonatomic, copy) NSString *advertiseType;
/** 商标图片 */
@property(nonatomic, strong) UIImage *logoImage;
/** 判断跳转到什么地反 */
@property(nonatomic, copy) NSString *logoType;

@property(nonatomic, weak) id<SZAdvertiseViewDelegate> delegate;

@end
