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
    NSString* callbackId = command.callbackId;
    PPDModalViewController *vc = [[PPDModalViewController alloc] init];
    
    if (callbackId) {
        [vc setParantCommandDelegate:self.commandDelegate];
        [vc setCallbackId:callbackId];
        
    }
    
    if (![[NSNull null] isEqual:url]) {
        vc.startPage = url;
    }
    else {
        vc.startPage = @"https://github.com/purpleworks-developer/cordova-plugin-modal";
    }
    
    [self.viewController presentViewController:vc animated:YES completion:^{
        
    }];
    
}

- (void)close:(CDVInvokedUrlCommand *)command
{
    CDVPluginResult* pluginResult = nil;
    
    if ([self.viewController isKindOfClass:[PPDModalViewController class]]) {
        PPDModalViewController *vc = (PPDModalViewController*)self.viewController;
        NSString* closeResultData = [command.arguments objectAtIndex:0];
        
        if (vc.callbackId && vc.parantCommandDelegate) {
            CDVPluginResult* closeResult = nil;
            if (![[NSNull null] isEqual:closeResultData]) {
                closeResult =[CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:closeResultData];
            }
            else {
                closeResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
            }
            
            [vc.parantCommandDelegate sendPluginResult:closeResult callbackId:vc.callbackId];
        }
        
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
