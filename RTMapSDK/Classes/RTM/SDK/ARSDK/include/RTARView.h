//
//  RTARView.h
//  RTMARDemo
//
//  Copyright © 2017年 智慧图. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RTMapLocationManager.h"

@class RTPOI;

@protocol RTARViewDelegate;
//AR 类型
typedef NS_ENUM(NSUInteger, RTARType) {
    RTARTypeNormal,     //  一般类型，即查看当前楼层指定范围(radius)内POI
    RTARTypeNavigation, //  导航类型，到达指定POI
    RTARTypeRounteLine, //  观光导航路线
};

//雷达位置
typedef NS_ENUM(NSUInteger, RTARRadarPosition) {
    RTARRadarPositionRightTop,                // 右上方
    RTARRadarPositionRightBottom,             // 右下方
    RTARRadarPositionLeftTop,                 // 左上方
    RTARRadarPositionLeftBottom,              // 左下方
};

@interface RTARView : UIView
/*!
 @property
 @abstract AR界面模式（1、浏览  2、导航）。
 */
@property (nonatomic, assign, readonly) RTARType type;
/*!
 @property
 @abstract 判断是否为导航模式。
 */
@property (nonatomic, assign) BOOL isARNavigation;

@property (nonatomic, weak) id<RTARViewDelegate>delegate;

/*!
 @property
 @abstract 展示半径，即展示半径内的所有POI 默认15。
 */
@property (nonatomic, assign) CGFloat radius;


/*!
 @property
 @abstract 雷达位置，默认右上。
 */
@property (nonatomic, assign) RTARRadarPosition radarPosition;

/*!
 @property
 @abstract 建筑物楼层。
 */
@property (nonatomic, strong, readonly) NSString * currentFloorID;

/*!
 @property
 @abstract 建筑物ID。
 */
@property (nonatomic, strong, readonly) NSString * currentBuildingID;

/*!
 @property
 @abstract 建筑物名称。
 */
@property (nonatomic, strong) NSString * currentBuildingName;


//滤镜类型
@property (nonatomic, assign) NSInteger filterType;

//观光路线数组
@property (nonatomic, strong) NSMutableArray *sightseeingRouteArray;


/**
 初始化
 
 @param buildingID 建筑物ID
 @param buildingID 楼层
 */
- (instancetype)initWithBuildingID:(NSString *) buildingID floorID:(NSString *) floorID;

/**
 导航

 @param destinationPOI 目的地POI
 */
- (void)navigateToPOI:(RTPOI *) destinationPOI;

//AR 开始 结束
- (void)start;
- (void)stop;

@end

@interface RTARView (NavigationConfig)



/*!
 @property
 @abstract 触碰距离 默认8米，即离目标点8米以内，就算到达目的地。
 */
@property (nonatomic, assign) CGFloat distance;
/*!
 @property
 @abstract 定位点。
 */
@property (nonatomic, assign) CGPoint locationPoint;
@end

@protocol RTARViewDelegate <NSObject>

@optional
//AR 成功开始，若要调用导航方法，请在此回调之后
- (void)didStartedOfARView:(RTARView *) aRView;

//ar 结束时调用，导航中返回返回时会返回目的地，一般模式destinationPOI为nil
- (void)rTARView:(RTARView *) aRView didDisappearType:(RTARType) type destinationPOI:(RTPOI *) destinationPOI;

- (void)userTouchPoiDetails:(RTPOI*)poi;

@end
