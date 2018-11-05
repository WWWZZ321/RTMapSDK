//
//  RTPOI.h
//  RTMARDemo
//
//  Copyright © 2017年 智慧图. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface RTPOI : NSObject<NSCoding>
@property (nonatomic, strong) NSString * buildingID;
@property (nonatomic, strong) NSString * floorID;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) NSString * pid;
@property (nonatomic, assign) CGPoint point;
@property (nonatomic, assign) CGFloat distance;
@property (nonatomic, assign) NSInteger type;
@property (nonatomic, assign) NSInteger level;
@property (nonatomic, strong) NSString * direction;


@property (nonatomic, assign) CGFloat surplusTime;
@property (nonatomic, assign) CGFloat surplusDistance;

- (instancetype)initWithObjc:(id) objc;

+ (void)savePOIs:(NSArray *) POIs forKey:(NSString *) key;
+ (NSArray *)loadPOIsForKey:(NSString *) key;
@end
