//
//  CircularProgressView.h
//  圆形进度条
//
//  Created by 潘伟建 on 2017/11/23.
//  Copyright © 2017年 潘伟建. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CircularProgressView : UIView

@property(nonatomic, assign) CGFloat progress;

@property(nonatomic, assign) CGFloat lineWidth;

@property(nonatomic, assign) CGFloat duration;

@property(nonatomic, strong) NSArray * gradientColors;

@property(nonatomic, strong) UIColor * strokeColor;


@end
