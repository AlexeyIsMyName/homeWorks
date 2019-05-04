//
//  AppDelegate.m
//  homework12(Blocks)
//
//  Created by Алексей on 04/05/2019.
//  Copyright © 2019 Aleksey Suslov. All rights reserved.
//

#import "AppDelegate.h"
#import "Student.h"

typedef void (^TestBlockWithoutParams)(void);

typedef void (^TestBlockWithInOneStringParams)(NSString*);

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    /*
     Ученик. Фактически это повторить первую половину.
     1! В апп делегате создайте блок с без возвращаемой переменной и без параметров и вызовите его.
     2! Создайте блоки с параметрами и передайте туда строку, которую выведите на экран в последствии.
     3! Если вы не определили тип данных для ваших блоков, то сделайте это сейчас и используйте их
     4! Создайте метод который принимает блок и вызывает его и вызовите этот метод.
    */
    
    TestBlockWithoutParams testBlock = ^{
        NSLog(@"test block");
    };
    
    TestBlockWithInOneStringParams testBlockWithStringParams = ^(NSString* string){
        NSLog(@"testBlockWithStringParams %@", string);
    };
    
    testBlock();
    testBlockWithStringParams(@"TEST STRING");
    
    [self testBlocksMethod:^{
        NSLog(@"it is awesome");
    }];
    
    /*
     Студент.
     5! Создайте класс студент с проперти имя и фамилия.
     6! Создайте в аппделегате 10 разных студентов, пусть у парочки будут одинаковые фамилии.
     7! Поместите всех в массив.
     8! Используя соответствующий метод сортировки массива (с блоком) отсортируйте массив студентов сначала по фамилии, а если они одинаковы то по имени.
    */
    
    Student *student1 = [[Student alloc] initWithName:@"Boris" sName:@"Britva"];
    Student *student2 = [[Student alloc] initWithName:@"Vlodimir" sName:@"Dolgorukiy"];
    Student *student3 = [[Student alloc] initWithName:@"Nikolay" sName:@"Petrovich"];
    Student *student4 = [[Student alloc] initWithName:@"Aleksey" sName:@"Neproley"];
    Student *student5 = [[Student alloc] initWithName:@"Dmitry" sName:@"Nezloy"];
    Student *student6 = [[Student alloc] initWithName:@"Konstantin" sName:@"Habenskiy"];
    Student *student7 = [[Student alloc] initWithName:@"Petr" sName:@"Petrovich"];
    Student *student8 = [[Student alloc] initWithName:@"Aleksandr" sName:@"Nosov"];
    Student *student9 = [[Student alloc] initWithName:@"Pavel" sName:@"Kuznecov"];
    Student *student10 = [[Student alloc] initWithName:@"Kirill" sName:@"Fedorov"];
    
    NSArray *students = [NSArray arrayWithObjects:
                         student1,
                         student2,
                         student3,
                         student4,
                         student5,
                         student6,
                         student7,
                         student8,
                         student9,
                         student10,
                         nil];
    
    NSComparisonResult (^ComparatorSortStudentsBySNameAndName)(Student *obj1, Student *obj2) = ^(Student *obj1, Student *obj2){
        if (obj1.sName == obj2.sName) {
            return [obj1.name compare:obj2.name];
        } else {
            return [obj1.sName compare:obj2.sName];
        }
    };
    
    NSArray *sortedStudents = [students sortedArrayUsingComparator:ComparatorSortStudentsBySNameAndName];
    
    for (Student *student in sortedStudents) {
        NSLog(@"%@ %@", student.name, student.sName);
    }
    
    /*
     Мастер.
     9. Задание из видео. Из урока о делегатах. У пациентов удалите протокол делегат и соответствующее проперти.
     10. Добавьте метод принимающий блок когда им станет плохо.
     11. Блок должен передавать указатель на самого студента ну и на те параметры, которые были в задании по делегатам.
     12. Теперь когда пациентам поплохеет, они должны вызывать блок, а в блоке нужно принимать решения что делать (доктор не нужен делайте все в апп делегате)
    */
    
    
    
    /*
     Супермен
     13. Познайте истинное предназначение блоков :) Пусть пациентам становится плохо не тогда когда вы их вызываете в цикле(это убрать), а через случайное время 5-15 секунд после создания (используйте специальный метод из урока по селекторам в ините пациента).
     14. не забудьте массив пациентов сделать проперти аппделегата, а то все помрут по выходе из функции так и не дождавшись :)
    */
    
    
    
    return YES;
}

- (void) testBlocksMethod:(TestBlockWithoutParams) testBlock {
    NSLog(@"testBlocksMethod");
    testBlock();
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
