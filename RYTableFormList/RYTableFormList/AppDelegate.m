//
//  AppDelegate.m
//  RYTableFormList
//
//  Created by wwt on 16/1/15.
//  Copyright (c) 2016年 rongyu. All rights reserved.
//

#import "AppDelegate.h"
#import "ExampleViewController.h"


#define api_domain @"https://192.168.253.33:454/"

@interface AppDelegate () <NSURLConnectionDataDelegate,NSURLSessionDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    //设置statusBar为白色
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    ExampleViewController *exampleViewController = [[ExampleViewController alloc] init];
    self.window.rootViewController = exampleViewController;
    
    [self provinceAndCityDatas];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - NSURLSessionDelegate

- (void)URLSession:(NSURLSession *)session didReceiveChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition disposition, NSURLCredential * __nullable credential))completionHandler{
    SecTrustRef serverTrust = challenge.protectionSpace.serverTrust;
    NSArray *serverCertificates = CertificateTrustChainForServerTrust(serverTrust);
    //获取服务器证书
    NSString *base64string = [serverCertificates[0] base64EncodedStringWithOptions:0];
    NSLog(@"证书---%@",base64string);
}


static NSArray * CertificateTrustChainForServerTrust(SecTrustRef serverTrust) {
    CFIndex certificateCount = SecTrustGetCertificateCount(serverTrust);
    NSMutableArray *trustChain = [NSMutableArray arrayWithCapacity:(NSUInteger)certificateCount];
    for (CFIndex i = 0; i < certificateCount; i++) {
        SecCertificateRef certificate = SecTrustGetCertificateAtIndex(serverTrust, i);
        [trustChain addObject:(__bridge_transfer NSData *)SecCertificateCopyData(certificate)];
    }
    return [NSArray arrayWithArray:trustChain];
}

#pragma mark - NSURLConnectionDataDelegate

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
}

#pragma mark - NSURLConnectionDelegate

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
}

/**
 *  需要添加AFNetWorking中对于证书的验证
 *
 *  @param connection NSURLConnection
 *  @param challenge  NSURLAuthenticationChallenge
 */
- (void)connection:(NSURLConnection *)connection willSendRequestForAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge
{
    if ([challenge.protectionSpace.authenticationMethod
         isEqualToString:NSURLAuthenticationMethodServerTrust]) {
        // we only trust our own domain
        
        NSArray *hostsArray = [api_domain componentsSeparatedByString:@":"];
        NSString *hostAllowStr = [hostsArray[1] substringFromIndex:[@"//" length]];
        
        if ([challenge.protectionSpace.host isEqualToString:hostAllowStr]) {
            SecTrustRef trust = challenge.protectionSpace.serverTrust;
            NSURLCredential *credential = [NSURLCredential credentialForTrust:trust];
            [challenge.sender useCredential:credential forAuthenticationChallenge:challenge];
        }
    }
    
    [challenge.sender continueWithoutCredentialForAuthenticationChallenge:challenge];
}

#pragma mark - private methods

//请求省市县接口
- (void)provinceAndCityDatas {
    
    NSString *str=[NSString stringWithFormat:@"%@Content2/scripts/ProvinceCityCounty.js",api_domain];
    NSURL *url = [NSURL URLWithString:[str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    //1 request
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection connectionWithRequest:request delegate:self];
    //2 connection sendasync异步请求
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        
        NSString *ProvinceCityCounty = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        
        NSLog(@"省市县数据结构 %@",ProvinceCityCounty);
        
    }];
    
}

@end
