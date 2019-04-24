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
    
//    Уровень Ученик
//
//    1. Создайте класс студент со свойствами имя, фамилия и фраза приветствия.
//    2. Создайте 10 - 15 объектов этого класса.
//    3. Теперь мы создадим дикшинари типо школьный журнал, где ключ будет фамилия + имя, а значение сам студент.
//    4. Распечатайте дикшинари
    NSLog(@"~~~~~~~~~~ SchoolBoy ~~~~~~~~~~");
    
    Student *student1 = [[Student alloc] initWithName:@"Aleksey" surname:@"Suslov"];
    Student *student2 = [[Student alloc] initWithName:@"Sergey" surname:@"Voroncov"];
    Student *student3 = [[Student alloc] initWithName:@"Vlodimir" surname:@"Borisov"];
    Student *student4 = [[Student alloc] initWithName:@"Boris" surname:@"Kuznecov"];
    Student *student5 = [[Student alloc] initWithName:@"Grigoriy" surname:@"Voroshilov"];
    Student *student6 = [[Student alloc] initWithName:@"Svetlana" surname:@"Nemaya"];
    Student *student7 = [[Student alloc] initWithName:@"Nelly" surname:@"Smith"];
    Student *student8 = [[Student alloc] initWithName:@"Mariya" surname:@"Viktorovna"];
    Student *student9 = [[Student alloc] initWithName:@"Aleksandr" surname:@"Sergeevich"];
    Student *student10 = [[Student alloc] initWithName:@"Anatoliy" surname:@"Anatolievich"];
    
    NSDictionary *journal = @{[student1 fullname]: student1,
                              [student2 fullname]: student2,
                              [student3 fullname]: student3,
                              [student4 fullname]: student4,
                              [student5 fullname]: student5,
                              [student6 fullname]: student6,
                              [student7 fullname]: student7,
                              [student8 fullname]: student8,
                              [student9 fullname]: student9,
                              [student10 fullname]: student10};
    
    NSLog(@"%@", journal);
    
//    Уровень Студент.
//
//    4. В цикле пройдемся по всем ключам в дикшинари и распечатаем имя и фамилию каждого студента + его фразу приветствия.
    
    NSLog(@"~~~~~~~~~~ Student ~~~~~~~~~~");
    
    for (NSString *key in [journal allKeys]) {
        Student *student = [journal objectForKey:key];
        [student hello];
    }
    
//    Уровень Мастер.
//
//    5. Чтобы сделать тоже самое но по какому-то порядку, отсортируйте массив ключей по возрастанию и выведите приветствие каждого студента из дикшинари, но уже по отсортированному списку.
    
    NSLog(@"~~~~~~~~~~ Master ~~~~~~~~~~");
    
    NSArray *sortedKeys = [[journal allKeys] sortedArrayUsingSelector:@selector(compare:)];
    
    for (NSString *key in sortedKeys) {
        Student *student = [journal objectForKey:key];
        [student hello];
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
