//
//  introPlayerAppDelegate.h
//  introPlayer
//
//  Created by Oscar Abraham on 9/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@class introPlayerViewController;

@interface introPlayerAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet introPlayerViewController *viewController;

@end
