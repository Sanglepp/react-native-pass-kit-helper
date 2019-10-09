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

RCT_EXPORT_METHOD(suppressApplePay)
{
    if (@available(iOS 9, *)) {
        // iOS 9 (or newer) ObjC code
        if ([PKPassLibrary isPassLibraryAvailable] && ![PKPassLibrary isSuppressingAutomaticPassPresentation]) {
            tokenPKSuppresion = [PKPassLibrary requestAutomaticPassPresentationSuppressionWithResponseHandler:^(PKAutomaticPassPresentationSuppressionResult result) {
                if (result == PKAutomaticPassPresentationSuppressionResultSuccess) {
                    RCTLogInfo(@"Automatic Pass Presentation suppressed");
                } else {
                    RCTLogInfo(@"Could not suppress Automatic Pass Presentation");
                }
            }];
        }
    }
}

RCT_EXPORT_METHOD(enableApplePay)
{
    if (@available(iOS 9, *)) {
        if ([PKPassLibrary isPassLibraryAvailable] && [PKPassLibrary isSuppressingAutomaticPassPresentation]) {
            [PKPassLibrary endAutomaticPassPresentationSuppressionWithRequestToken:tokenPKSuppresion];
            RCTLogInfo(@"Automatic Pass Presentation enabled");
        }
    }
}

@end
