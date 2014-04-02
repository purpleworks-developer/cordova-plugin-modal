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
    PPDModalViewController *vc = [[PPDModalViewController alloc] init];
    NSArray* arguments = command.arguments;
    NSString* url = arguments[0];
    if (url) {
        vc.startPage = url;
    }
    
    [self.viewController presentViewController:vc animated:YES completion:^{
        
    }];
}

- (void)close:(CDVInvokedUrlCommand *)command
{
    [self.viewController dismissModalViewControllerAnimated:YES];
}
@end
