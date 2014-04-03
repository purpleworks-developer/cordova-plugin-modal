//
//  PPDModalViewController.h
//  HelloCordova
//
//  Created by purpleworks on 4/2/14.
//
//

#import <Cordova/CDVViewController.h>

@interface PPDModalViewController : CDVViewController
@property (nonatomic, strong) NSString *callbackId;
@property (nonatomic, weak) id <CDVCommandDelegate> parantCommandDelegate;
@end
