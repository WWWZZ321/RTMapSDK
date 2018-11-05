//
//  SVProgressHUD.h
//
//  Created by Sam Vermette on 27.03.11.
//  Copyright 2011 Sam Vermette. All rights reserved.
//
//  https://github.com/samvermette/SVProgressHUD
//

#import <UIKit/UIKit.h>
#import <AvailabilityMacros.h>

enum {
    RTMapProgressHUDMaskTypeNone = 1, // allow user interactions while HUD is displayed
    RTMapProgressHUDMaskTypeClear, // don't allow
    RTMapProgressHUDMaskTypeBlack, // don't allow and dim the UI in the back of the HUD
    RTMapProgressHUDMaskTypeGradient // don't allow and dim the UI with a a-la-alert-view bg gradient
};

typedef NSUInteger RTMapProgressHUDMaskType;

@interface RTMapProgressHUD : UIView

+ (void)show;
+ (void)showWithStatus:(NSString*)status;
+ (void)showWithStatus:(NSString*)status maskType:(RTMapProgressHUDMaskType)maskType;
+ (void)showWithMaskType:(RTMapProgressHUDMaskType)maskType;

+ (void)showSuccessWithStatus:(NSString*)string;
+ (void)showSuccessWithStatus:(NSString *)string duration:(NSTimeInterval)duration;
+ (void)showErrorWithStatus:(NSString *)string;
+ (void)showErrorWithStatus:(NSString *)string duration:(NSTimeInterval)duration;

+ (void)setStatus:(NSString*)string; // change the HUD loading status while it's showing

+ (void)dismiss; // simply dismiss the HUD with a fade+scale out animation
+ (void)dismissWithSuccess:(NSString*)successString; // also displays the success icon image
+ (void)dismissWithSuccess:(NSString*)successString afterDelay:(NSTimeInterval)seconds;
+ (void)dismissWithError:(NSString*)errorString; // also displays the error icon image
+ (void)dismissWithError:(NSString*)errorString afterDelay:(NSTimeInterval)seconds;

+ (BOOL)isVisible;

// deprecated methods; it shouldn't be the HUD's responsability to show/hide the network activity indicator
+ (void)showWithStatus:(NSString*)status networkIndicator:(BOOL)show DEPRECATED_ATTRIBUTE;
+ (void)showWithStatus:(NSString*)status maskType:(RTMapProgressHUDMaskType)maskType networkIndicator:(BOOL)show DEPRECATED_ATTRIBUTE;
+ (void)showWithMaskType:(RTMapProgressHUDMaskType)maskType networkIndicator:(BOOL)show DEPRECATED_ATTRIBUTE;

@end
