//
//  CJRefreshControl.h
//  CJRefreshExample
//
//  Created by Chen_Jun on 2017/7/11.
//  Copyright © 2017年 zwu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface CJRefreshControl : UIControl

/** 形状layer */
@property (nonatomic, strong) CAShapeLayer *shapeLayer;
/** 箭头layer */
@property (nonatomic, strong) CAShapeLayer *arrowLayer;
/** 高亮layer */
@property (nonatomic, strong) CAShapeLayer *highlightLayer;
/** 活动窗口View */
@property (nonatomic, strong) UIView *activity;;

@property (nonatomic, assign) BOOL    canRefresh;
@property (nonatomic, assign) BOOL    ignoreInset;
@property (nonatomic, assign) BOOL    ignoreOffset;
@property (nonatomic, assign) BOOL    didSetInset;
@property (nonatomic, assign) BOOL    hasSectionHeaders;
@property (nonatomic, assign) CGFloat lastOffset;

@property (nonatomic, readonly, getter=isRefreshing) BOOL refreshing;


/** 刷新菊花的样式 */
@property (nonatomic, assign) UIActivityIndicatorViewStyle activityIndicatorViewStyle UI_APPEARANCE_SELECTOR;
/** 下拉圆圈的颜色 */
@property (nonatomic, strong) UIColor *tintColor UI_APPEARANCE_SELECTOR;
/** 下拉箭头的颜色 */
@property (nonatomic, strong) UIColor *arrowColor UI_APPEARANCE_SELECTOR;
/** 刷新菊花的颜色 */
@property (nonatomic, strong) UIColor *activityIndicatorViewColor UI_APPEARANCE_SELECTOR; // iOS5 or more



- (instancetype)initInScrollView:(UIScrollView *)scrollView;

// use custom activity indicator
- (instancetype)initInScrollView:(UIScrollView *)scrollView activityIndicatorView:(UIView *)activity;

// Tells the control that a refresh operation was started programmatically
- (void)beginRefreshing;

// Tells the control the refresh operation has ended
- (void)endRefreshing;

@end
