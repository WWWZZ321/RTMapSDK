//
//  ZHTMapManager.h
//  WPMapLib_Example
//
//  Created by zhangz on 2018/10/26.
//  Copyright © 2018 WWWZZ321. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RTLbsMapManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZHTMapManager : NSObject

@property (nonatomic, strong) RTLbsMapManager *mapManager;

/**
 地图管理类

 @return ZHTMapManager
 */
+ (instancetype)shareInstance;

- (void) startMapWithKey:(NSString *)key delegate:(id<RTLbsVerifyDelegate>)delgate;

+ (void) openMapTolocation;


@end

NS_ASSUME_NONNULL_END
