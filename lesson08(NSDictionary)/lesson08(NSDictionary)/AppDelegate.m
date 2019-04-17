//
//  AppDelegate.m
//  lesson08(NSDictionary)
//
//  Created by Алексей on 16/04/2019.
//  Copyright © 2019 Aleksey Suslov. All rights reserved.
//

#import "AppDelegate.h"
#import "Student.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    Student *student1 = [[Student alloc] init];
    
    
    
    
    
    student1.name = @"Aleksey";
    student1.surname = @"Suslov";
    
    NSLog(@"test, print full name %@", [student1 fullname]);
    [student1 hello];
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    /*
     Уровень Ученик
     
     1. Создайте класс студент со свойствами имя, фамилия и фраза приветствия.
     2. Создайте 10 - 15 объектов этого класса.
     3. Теперь мы создадим дикшинари типо школьный журнал, где ключ будет фамилия + имя, а значение сам студент.
     4. Распечатайте дикшинари
     
     Уровень Студент.
     
     4. В цикле пройдемся по всем ключам в дикшинари и распечатаем имя и фамилию каждого студента + его фразу приветствия.
     
     Уровень Мастер.
     
     5. Чтобы сделать тоже самое но по какому-то порядку, отсортируйте массив ключей по возрастанию и выведите приветствие каждого студента из дикшинари, но уже по отсортированному списку.
     
     */

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
