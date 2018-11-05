//
//  ZHTMapManager.m
//  WPMapLib_Example
//
//  Created by zhangz on 2018/10/26.
//  Copyright © 2018 WWWZZ321. All rights reserved.
//

#import "ZHTMapManager.h"

@implementation ZHTMapManager


static ZHTMapManager * shareInstance = nil;
+ (instancetype)shareInstance{

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareInstance = [[ZHTMapManager alloc] init];
    });
    return shareInstance;
}

- (void)startMapWithKey:(NSString *)key delegate:(id<RTLbsVerifyDelegate>)delgate
{
    self.mapManager.apiServerUrl =  @"https://lbsapi.rtmap.com";
    [self.mapManager startVerifyLicense:key delegate:delgate];

}

-(RTLbsMapManager *)mapManager{
    if (!_mapManager) {
        _mapManager = [[RTLbsMapManager alloc]init];
    }
    return _mapManager;
}

@end
