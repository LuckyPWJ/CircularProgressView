//
//  CircularProgressView.m
//  圆形进度条
//
//  Created by 潘伟建 on 2017/11/23.
//  Copyright © 2017年 潘伟建. All rights reserved.
//

#import "CircularProgressView.h"

@interface CircularProgressView()

@end

@implementation CircularProgressView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //设置背景色防止获取数据错误无法正常显示，显示默认的黑色背景，可设置成父控件的背景色
        self.backgroundColor = [UIColor whiteColor];
        
        _gradientColors = @[];
        _strokeColor = [UIColor grayColor];
        _lineWidth = 12;
        _duration = 1;
    }
    return self;
}

-(void)drawRect:(CGRect)rect
{
    CALayer *layer = [CALayer layer];
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = self.bounds;
    gradientLayer.colors = _gradientColors;
    [layer addSublayer:gradientLayer];
    
    CAShapeLayer * shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame = self.bounds;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.strokeColor = _strokeColor.CGColor;
    shapeLayer.lineWidth = _lineWidth;
    shapeLayer.lineCap = kCALineCapRound;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2) radius:self.bounds.size.width/2 - _lineWidth startAngle:0 endAngle:M_PI * 2 * _progress  clockwise:YES];
    shapeLayer.path = path.CGPath;
    [self.layer addSublayer:shapeLayer];
    
    [layer setMask:shapeLayer];
    [self.layer addSublayer:layer];
    
    CABasicAnimation *transformAnima = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    transformAnima.fromValue = @(0);
    transformAnima.toValue = @(1);
    transformAnima.duration = _duration;
    [shapeLayer addAnimation:transformAnima forKey:@"animation"];
}

-(void)setProgress:(CGFloat)progress
{
    _progress = progress;
    
    [self setNeedsDisplay];
}

@end
