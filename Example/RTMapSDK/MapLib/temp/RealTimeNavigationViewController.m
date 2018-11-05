//
//  RealTimeNavigationViewController.m
//  3DMap_new
//
//  Created by wang jinchang on 2017/9/11.
//  Copyright © 2017年 wang jinchang. All rights reserved.
//

#import "RealTimeNavigationViewController.h"
#import "RTMapLocationManager.h"
#import "RTLbsMapView.h"
#import "RTLbs3DNavigationInfo.h"

#import "UIView+Additions.h"

#import "UtilityStyle.h"

#define kRouteSelectViewHeight 120
#define kRoutePlanViewHeight 55
#define kStartNavViewHeight 65
#define kNavigationDescViewHeight 80
#define kNavSettingViewHeight  50
#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height

#define Buildid @"860100010040500017"
static NSString *const rtlbsUrlString = @"http://lbsapi.rtmap.com";
@interface RealTimeNavigationViewController ()<RTLbsMapViewDelegate,RTMapLocationManagerDelegate>
{
    BOOL     _isNavigation;
    BOOL     _isNav;
    CGPoint  _locationPoint;
    NSString *_locationFloor;
    NSString *_floor;
}


@property (nonatomic,retain)RTLbsMapView *mapView;
@property (retain,nonatomic)RTMapLocationManager *location;

@property (nonatomic,strong)NSMutableArray  *savNavigationNode;//保存导航线节点
@end

@implementation RealTimeNavigationViewController

- (void)viewWillAppear:(BOOL)animated {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    _floor = @"F10";
    CGRect scBound = [[UIScreen mainScreen] bounds];
    self.mapView = [[RTLbsMapView alloc] initWithFrame:scBound building:Buildid floor:_floor serverUrl:rtlbsUrlString scale:500  delegate:self];
    self.mapView.navStartImage = [UIImage imageNamed:@"nav_start"];
    self.mapView.navEndImage   = [UIImage imageNamed:@"nav_end"];
    [self.view addSubview:self.mapView];
    [self.view sendSubviewToBack:self.mapView];
    
    [self startLocation];
    
}


// 开始定位
- (void) startLocation {
    self.location = [RTMapLocationManager sharedInstance];
    self.location.delegate = self;
    [self.location startUpdatingLocation];
}

// 停止定位
- (void) stopLocation {
    [self.location stopUpdatingLocation];
}

// 清除导航路线
- (IBAction)touchClearNaviLinesBtn:(UIButton *)sender {
    _isNavigation = NO;
    [self.mapView removeNavAnnotationsAndNavLine];
    
 
}

//设置导航模式
- (IBAction)startNavigationMode:(id)sender {
    self.mapView.navigationMode = RTLbsRoutePlanningModeNavigation;
}

//设置普通模式
- (IBAction)clearNavigationMode:(id)sender {
    self.mapView.navigationMode = RTLbsRoutePlanningModeNone;
}


#pragma mark - mapview delegate
- (void) mapViewDidTapOnMapPoint:(CGPoint)point poiName:(NSString*)poiName poiID:(NSString*)ID shapType:(NSInteger)type{
    if(!_isNavigation){
        [self.mapView mapViewNavgationStartPoint:_locationPoint buildingID:Buildid floorID:_locationFloor delegate:self];
        [self.mapView mapViewNavgationEndPoint:point buildingID:Buildid floorID:_floor delegate:self];
    }
}

- (void) navigationRequestFinish:(NSMutableArray*)navigationInfo  navigationRountInflection:(NSMutableArray*)InflectionArrays    routeStringArrays:(NSMutableArray*)routeString poiIndexArray:(NSMutableArray *)poiIndexArray totalDistance:(NSString*)distance{
    _isNavigation = YES;
    self.savNavigationNode = navigationInfo;
    RTLbs3DNavigationInfo * firstNavigation = InflectionArrays.firstObject;
    if ([self.mapView.floor isEqualToString:firstNavigation.navFloor]) {
        [self.mapView drawNavigationLine:navigationInfo floorId:_floor];
        
    }else{
        [self.mapView reloadMapWithBuilding:self.mapView.build andFloor:firstNavigation.navFloor];
    }
    
}

#pragma mark iBeacon delegate
- (void)beaconManager:(RTMapLocationManager *)manager
  didUpdateToLocation:(IbeaconLocation *)newLocation
          withBeacons:(NSArray *) beacons{
    
    NSLog(@"定位成功 (%f,%f) floor = %@     build:%@\n-------------------",newLocation.location_x,newLocation.location_y,newLocation.floorID,newLocation.buildID);
    
    _locationPoint = CGPointMake(newLocation.location_x,newLocation.location_y);
    _locationFloor = newLocation.floorID;
    [self.mapView drawMobilePositioningPoint:_locationPoint AndBuild:newLocation.buildID AndFloor:newLocation.floorID locationImageName:@"location.png"];
   
}

-(void)beaconManager:(RTMapLocationManager *)manager didFailLocation:(NSDictionary *)result withBeacons:(NSArray *)beacons
{
    NSLog(@"定位出错 \n result = %@ %@",result,result[@"errorDesc"]);
    
}


#pragma market - mapViewDelegate
- (void) mapViewWithUserActionMap:(RTLbsMapView*)rtmapView {
    [self clearNavigationMode:nil];
}

- (void) mapViewLoadedSuccess:(RTLbsMapView*)rtmapView{
    _floor = rtmapView.floor;
    if(self.savNavigationNode.count>0){
        [self.mapView drawNavigationLine:self.savNavigationNode floorId:self.mapView.floor];
    }
}

- (void) mapViewInflectionPoint:(RTLbs3DNavigationInfo *)inflection allDistance:(float)distance isEndPoi:(BOOL)endPoi{
    NSLog(@"-----------> %@ %f",inflection.poiName,distance);
}

- (void) viewWillDisappear:(BOOL)animated {
    [self stopLocation];
    self.location.delegate = nil;
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
