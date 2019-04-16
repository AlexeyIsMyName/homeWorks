//
//  AppDelegate.m
//  DataTypesHomework
//
//  Created by Алексей on 09/04/2019.
//  Copyright © 2019 Aleksey. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    /*
    1. Я очень хочу чтобы вы попрактиковались создавать и использовать enum списки. Они ОЧЕНЬ распространены, они делают код красивее и вносят дополнительную информацию. Это просто очень хорошая практика их использовать! Практикуйтесь! Создайте кучу разных пропертей под разные энумы. Постарайтесь усвоить это сразу.
    
    2. Надо попрактиковаться со структурами. Например такое небольшое задание:
    на поле 10х10 рандомно создайте точек (разберитесь как рандомно генерировать цифры, подсказка - функция arc4random()) и проверяйте какая из точек попадает в квадрат размером 3х3 в самом центре поля. Грубо говоря надо определить какие из точек в массиве попадают в центр и вывести их на печать. Пробуйте и задавайте вопросы.
    
    3. Разберитесь с оболочками NSNumber и NSValue. На самом деле тут все предельно просто, но вы должны понять саму суть.
    */
    
    CGRect gamefield = CGRectMake(4, 4, 3, 3);
    
    for (int i = 0; i <= 30; i += 1) {
        CGPoint shot = CGPointMake(arc4random_uniform(10) + 1, arc4random_uniform(10) + 1);
        if (CGRectContainsPoint(gamefield, shot)) {
            NSLog(@"Shot to point = %@ Hit the target!", NSStringFromCGPoint(shot));
        } else {
            NSLog(@"Shot to point = %@ Miss the target!", NSStringFromCGPoint(shot));
        }
    }
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
