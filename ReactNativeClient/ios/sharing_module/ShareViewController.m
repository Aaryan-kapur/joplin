//
//  ShareViewController.m
//  sharing_module
//
//  Created by Aaryan Kapur on 15/03/20.
//  Copyright © 2020 Facebook. All rights reserved.
//

#import "ShareViewController.h"
#import "RCTRootView.h"
#import "RCTBundleURLProvider.h"
#import "RNFileShareIntent.h"

@interface ShareViewController ()

@end

@implementation ShareViewController

- (void) loadView
{
NSURL *jsCodeLocation;

NSExtensionItem *item = self.extensionContext.inputItems.firstObject;
NSItemProvider *itemProvider = item.attachments.firstObject;
[RNFileShareIntent setShareFileIntentModule_itemProvider:itemProvider];
[RNFileShareIntent setContext: self.extensionContext];


#if DEBUG
jsCodeLocation = [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"Share" fallbackResource:nil];
#else
jsCodeLocation = [NSURL URLWithString:@"http://localhost:8081/share.bundle?platform=ios&dev=true"];
// Change localhost to your network Ip for your Device Debugging
#endif


RCTRootView *rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation
moduleName:@"Share"
initialProperties:nil
launchOptions:nil];
self.view = rootView;
}

// animate (IN)
- (void)viewWillAppear:(BOOL)animated
{
[super viewWillAppear:animated];

self.view.transform = CGAffineTransformMakeTranslation(0, self.view.frame.size.height);
[UIView animateWithDuration:0.25 animations:^
{
self.view.transform = CGAffineTransformIdentity;
}];
}


@end
