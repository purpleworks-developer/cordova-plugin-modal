//
//  PPDModal.h
//  HelloCordova
//
//  Created by purpleworks on 4/2/14.
//
//

#import <Cordova/CDVPlugin.h>
#import <Cordova/CDVInvokedUrlCommand.h>

@interface PPDModal : CDVPlugin

- (void)open:(CDVInvokedUrlCommand*)command;
- (void)close:(CDVInvokedUrlCommand*)command;

@end
