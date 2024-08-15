//  PassKit helper and bridge for suppressing Apple Pay in React-Native
//
//  Created by Arnold Sanglepp on 26-10-2019.
//  Copyright © 2019 Singleton Group OÜ
//  All rights reserved.
//

#import "PassKitHelper.h"
#import <React/RCTLog.h>

@import Foundation;
@import PassKit;


@implementation PassKitHelper {
    @private PKSuppressionRequestToken tokenPKSuppresion;
}


RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(suppressApplePay:(RCTResponseSenderBlock)callback)
{
    if (@available(iOS 9, *)) {
        // iOS 9 (or newer) ObjC code
        if ([PKPassLibrary isPassLibraryAvailable] && ![PKPassLibrary isSuppressingAutomaticPassPresentation]) {
            tokenPKSuppresion = [PKPassLibrary requestAutomaticPassPresentationSuppressionWithResponseHandler:^(PKAutomaticPassPresentationSuppressionResult result) {
                    switch (result) {
                        case PKAutomaticPassPresentationSuppressionResultSuccess:
                            RCTLogInfo(@"Automatic Pass Presentation suppressed");
                            callback(@[@(result)]);
                            break;
                        case PKAutomaticPassPresentationSuppressionResultDenied:
                            RCTLogInfo(@"Automatic Pass Presentation suppression denied");
                            callback(@[@(result)]);
                            break;
                        case PKAutomaticPassPresentationSuppressionResultCancelled:
                            RCTLogInfo(@"Automatic Pass Presentation suppression cancelled");
                            callback(@[@(result)]);
                            break;
                        case PKAutomaticPassPresentationSuppressionResultNotSupported:
                            RCTLogInfo(@"Automatic Pass Presentation suppression not supported");
                            callback(@[@(result)]);
                            break;
                        case PKAutomaticPassPresentationSuppressionResultAlreadyPresenting:
                            RCTLogInfo(@"Automatic Pass Presentation suppression already presenting");
                            callback(@[@(result)]);
                            break;
                    }
            }];
        } else {
            RCTLogInfo(@"Automatic Pass Library not supported");
            callback(@[@(PKAutomaticPassPresentationSuppressionResultDenied)]);
        }
    } else {
        RCTLogInfo(@"iOS 9 lower not supported");
        callback(@[@(PKAutomaticPassPresentationSuppressionResultDenied)]);
    }
}

RCT_EXPORT_METHOD(enableApplePay:(RCTResponseSenderBlock)callback)
{
    if (@available(iOS 9, *)) {
        if ([PKPassLibrary isPassLibraryAvailable] && [PKPassLibrary isSuppressingAutomaticPassPresentation]) {
            [PKPassLibrary endAutomaticPassPresentationSuppressionWithRequestToken:tokenPKSuppresion];
            RCTLogInfo(@"Automatic Pass Presentation enabled");
            callback(@[@3]);
        }else {
            if([PKPassLibrary isSuppressingAutomaticPassPresentation]){
                RCTLogInfo(@"Automatic Pass already presenting");
                callback(@[@1]);
            }else if([PKPassLibrary isPassLibraryAvailable]){
                RCTLogInfo(@"Automatic Pass library is not available");
                callback(@[@2]);
            }
        }
    }else {
        RCTLogInfo(@"iOS 9 lower not supported");
        callback(@[@0]);
    }
}

@end
