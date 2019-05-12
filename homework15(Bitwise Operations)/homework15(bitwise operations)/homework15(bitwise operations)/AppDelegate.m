//
//  AppDelegate.m
//  homework15(bitwise operations)
//
//  Created by Алексей on 12/05/2019.
//  Copyright © 2019 Aleksey Suslov. All rights reserved.
//

#import "AppDelegate.h"
#import "Student.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    /*
     Ученик.
     1! Повторите мой код и создайте класс студент с соответствующим набором предметов
     2! В цикле создайте 10 студентов и добавьте их в массив. Используйте мутабл массив
     3! У каждого рандомно установите предметы
    */
    
    NSMutableArray *students = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < 1000; i++) {
        Student *student = [[Student alloc] init];
        student.subjectType = arc4random() % 128;
        [students addObject:student];
    }
    
    /*
     Студент
     4! В новом цикле пройдитесь по студентам и разделите их уже на два массива - технари и гуманитарии.
     5! Также посчитайте количество тех кто учит программирование
    */
    
    NSMutableArray *studentsWhoWantToKnowTech = [[NSMutableArray alloc] init];
    NSMutableArray *studentsWhoWantToKnowOther = [[NSMutableArray alloc] init];
    NSUInteger countWhoStudyingDevelopment = 0;
    
    for (Student *student in students) {
        if (student.subjectType == 14) {
            [studentsWhoWantToKnowTech addObject:student];
        }
        if (student.subjectType == 113) {
            [studentsWhoWantToKnowOther addObject:student];
        }
        if (student.subjectType & StudentSubjectTypeDevelopment) {
            countWhoStudyingDevelopment++;
        }
    }
    
    NSLog(@"Count of students who want to study Development equal to %ld", (long)countWhoStudyingDevelopment);
    
    /*
     Мастер.
     6! Если студенты выбрали биологию, то отмените ее у них и выведите сообщение в лог, предмет отменен
     7! Тут придется разобраться как сбросить бит, включите логику :)
    */
    NSInteger count = 0;
    
    for (int i = 0; i < [students count]; i++) {
        Student *student = [students objectAtIndex:i];
        if (student.subjectType & StudentSubjectTypeBiology) {
            student.subjectType = student.subjectType ^ StudentSubjectTypeBiology;
            [students replaceObjectAtIndex:i withObject:student];
            count++;
        }
    }
    
    if (count > 0) {
        NSLog(@"Biology canceled");
    }
    
    /*
     Супермен.
     8. Сгенерируйте случайный интежер в диапазоне от 0 до максимума.
     9. Используя цикл и битовые операыии (и возможно NSMutableString) выведите это число на экран в двоичном виде
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
