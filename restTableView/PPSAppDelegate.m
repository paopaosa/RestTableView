//
//  PPSAppDelegate.m
//  restTableView
//
//  Created by Paopaosa on 13-2-27.
//  Copyright (c) 2013年 Paopaosa. All rights reserved.
//

#import <RestKit/RestKit.h>
#import "PPSAppDelegate.h"
#import "AFNetworking.h"
#import "EXNewsItem.h"
#import "EXTableViewViewController.h"

@implementation PPSAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    RKLogConfigureByName("RestKit/Network*", RKLogLevelTrace);
    RKLogConfigureByName("RestKit/ObjectMapping", RKLogLevelTrace);
    
    NSURL *baseURL = [NSURL URLWithString:@"http://qsyripad.i-creative.cn"];
    AFHTTPClient *client = [AFHTTPClient clientWithBaseURL:baseURL];
    //we want to work with JSON-Data
    [client setDefaultHeader:@"Accept" value:RKMIMETypeJSON];//
//    [client setParameterEncoding:AFJSONParameterEncoding];
    
    
    // Initialize RestKit
    RKObjectManager *objectManager = [[RKObjectManager alloc] initWithHTTPClient:client];
    
    RKObjectMapping *recMapping = [RKObjectMapping mappingForClass:[EXNewsItem class]];
    [recMapping addAttributeMappingsFromDictionary:@{
     @"id": @"newsID",
     @"pic": @"pic",
     @"share_text": @"shareText",
     @"pub_date": @"pubDate",
     @"title": @"title",
     @"content": @"content"
     }];
    RKResponseDescriptor *responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:recMapping
                                                                                       pathPattern:nil
                                                                                           keyPath:@"list"
                                                                                       statusCodes:[NSIndexSet indexSetWithIndex:200]];
    [objectManager addResponseDescriptor:responseDescriptor];
    
    
//    NSURL *URL = [NSURL URLWithString:@"http://qsyripad.i-creative.cn/process.php?action=news_list"];
//    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
//    RKObjectRequestOperation *objectRequestOperation = [[RKObjectRequestOperation alloc] initWithRequest:request responseDescriptors:@[ responseDescriptor ]];
//    [objectRequestOperation setCompletionBlockWithSuccess:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
//        RKLogInfo(@"Load collection of Articles: %@", mappingResult.array);
//    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
//        RKLogError(@"Operation failed with error: %@", error);
//    }];
    
//    [objectRequestOperation start];
    EXTableViewViewController *sampleTableViewController = [[EXTableViewViewController alloc] initWithNibName:@"EXTableViewViewController" bundle:nil];
    self.window.rootViewController = sampleTableViewController;
     [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
