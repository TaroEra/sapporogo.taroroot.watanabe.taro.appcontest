//
//  AppDelegate.m
//  SapporoGo
//
//  Created by Taro Era on 2016/09/03.
//  Copyright © 2016年 com.era.watanabe.sapporo.go. All rights reserved.
//

#import "AppDelegate.h"
#import <Realm/Realm.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
//    [self congigureNursingHome];
//    [self configurePoliceStation];
    
    NSLog(@"%@", [RLMRealmConfiguration defaultConfiguration].fileURL);
    return YES;
}

//- (void)congigureNursingHome{
//    
//    NSArray *sections = [self parseCSV:@"nursing_home"];
//    
//    for (NSArray* array in sections) {
//        
//        if(array.count >= 10){
//            
//            /////create RealmObjectData
//            NSString *name = array[1];
//            NSString *address = array[2];
//            
//            NSString *latitudeString = (NSString *)array[3];
//            double latitude = latitudeString.doubleValue;
//            
//            NSString *longitudeString = array[4];
//            double longitude = longitudeString.doubleValue;
//            
//            NSString *facility_type = array[9];
//            /////
//            
//            /////create RealmObject and add RealmDB
//            RLMRealm *realm = [RLMRealm defaultRealm];
//            
//            [realm transactionWithBlock:^{
//                NursingHome *nursingHome = [[NursingHome alloc] initWithValue:@{@"name":name,
//                                                                                @"address":address,
//                                                                                @"latitude":@(latitude),
//                                                                                @"longitude":@(longitude),
//                                                                                @"type":facility_type}];
//                [realm addOrUpdateObject:nursingHome];
//            }];
            /////
//        }
//    }
//}

//- (void)configurePoliceStation{
//    
//    NSArray *sections = [self parseCSV:@"police_station"];
//    
//    for (NSArray* array in sections) {
//        
//            /////create RealmObjectData
//            NSString *name = array[2];
//            
//            NSString *address = @"北海道";
//            address = [address stringByAppendingString:array[8]];
//            address = [address stringByAppendingString:array[7]];
//            address = [address stringByAppendingString:array[6]];
//            
//            NSString *latitudeString = (NSString *)array[3];
//            double latitude = latitudeString.doubleValue;
//            
//            NSString *longitudeString = array[4];
//            double longitude = longitudeString.doubleValue;
//            
//            NSString *type = array[1];
//            /////
//            
//            /////create RealmObject and add RealmDB
//            RLMRealm *realm = [RLMRealm defaultRealm];
//            
//            [realm transactionWithBlock:^{
//                PoliceStation *policeStation = [[PoliceStation alloc] initWithValue:@{@"name":name,
//                                                                                @"address":address,
//                                                                                @"latitude":@(latitude),
//                                                                                @"longitude":@(longitude),
//                                                                                @"type":type}];
//                [realm addOrUpdateObject:policeStation];
//            }];
//            /////
//    }
//}

- (NSArray *)parseCSV:(NSString *)pathForResource{
    
    NSString *csvFile = [[NSBundle mainBundle] pathForResource:pathForResource ofType:@"csv"];
    NSData *csvData = [NSData dataWithContentsOfFile:csvFile];
    NSString *csv = [[NSString alloc] initWithData:csvData encoding:NSUTF16StringEncoding];
    NSScanner *scanner = [NSScanner scannerWithString:csv];
    
    // 改行文字の集合を取得
    NSCharacterSet *chSet = [NSCharacterSet newlineCharacterSet];
    // 一行ずつの読み込み
    NSString *line;
    NSMutableArray *sections = [[NSMutableArray alloc] init];
    while (![scanner isAtEnd]) {
        // 一行読み込み
        [scanner scanUpToCharactersFromSet:chSet intoString:&line];
        // カンマ「,」で区切る
        NSArray *array = [line componentsSeparatedByString:@","];
        // 配列に挿入する
        [sections addObject:array];
        //　改行文字をスキップ
        [scanner scanCharactersFromSet:chSet intoString:NULL];
    }
    return sections;
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString *,id> *)options{
    
    NSLog(@"scheme : %@",[url scheme]);
    
    UIViewController *topController = [UIApplication sharedApplication].keyWindow.rootViewController;
    while (topController.presentedViewController) {
        topController = topController.presentedViewController;
    }
    [topController dismissViewControllerAnimated:YES completion:nil];
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

@end
