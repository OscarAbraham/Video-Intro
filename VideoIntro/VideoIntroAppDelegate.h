//
//  VideoIntroAppDelegate.h
//  VideoIntro
//
//  Created by Oscar Abraham on 9/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class VideoIntroViewController;

@interface VideoIntroAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet VideoIntroViewController *viewController;

@end
