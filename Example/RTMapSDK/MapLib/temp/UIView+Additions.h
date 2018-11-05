//
//  UIView+Additions.h
//  HongKongAirportDemo
//
//  Created by zhaoyubin on 16/5/25.
//  Copyright © 2016年 rtmap. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Additions)
@property (nonatomic,assign) CGFloat left;
@property (nonatomic,assign) CGFloat top;
@property (nonatomic,assign) CGFloat right;
@property (nonatomic,assign) CGFloat bottom;
@property (nonatomic,assign) CGFloat width;
@property (nonatomic,assign) CGFloat height;

@property (nonatomic,assign) CGFloat centerX;
@property (nonatomic,assign) CGFloat centerY;

@property (nonatomic,assign) CGPoint origin;
@property (nonatomic,assign) CGSize size;

//将UIView对象设置成圆的
-(void)changeLayerWithRadius:(CGFloat)radius;

+ (UIViewAnimationOptions)animationOptionsForCurve:(UIViewAnimationCurve)curve;
@end
