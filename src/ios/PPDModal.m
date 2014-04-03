//
//  PPDModal.m
//  HelloCordova
//
//  Created by purpleworks on 4/2/14.
//
//

#import "PPDModal.h"
#import "PPDModalViewController.h"

@implementation PPDModal

- (void)open:(CDVInvokedUrlCommand *)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* url = [command.arguments objectAtIndex:0];
    
    PPDModalViewController *vc = [[PPDModalViewController alloc] init];
    
    if (url) {
        vc.startPage = url;
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    }
    else {
        vc.startPage = @"https://github.com/purpleworks-developer/cordova-plugin-modal";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"url was null"];
    }
    
    [self.viewController presentViewController:vc animated:YES completion:^{
        
    }];
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)close:(CDVInvokedUrlCommand *)command
{
    CDVPluginResult* pluginResult = nil;
    
    if ([self.viewController isKindOfClass:[PPDModalViewController class]]) {
        [self.viewController dismissViewControllerAnimated:YES completion:^{
            
        }];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    }
    else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"view is not modal"];
    }
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
@end
