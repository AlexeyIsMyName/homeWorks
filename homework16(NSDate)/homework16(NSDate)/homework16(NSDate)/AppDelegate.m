//
//  AppDelegate.m
//  homework16(NSDate)
//
//  Created by Алексей on 16/05/2019.
//  Copyright © 2019 Aleksey Suslov. All rights reserved.
//

#import "AppDelegate.h"
#import "Student.h"

@interface AppDelegate ()

@property (strong, nonatomic) NSDate *dateOfTimer;
@property (strong, nonatomic) NSArray *sortedStudents;
@property (assign, nonatomic) NSInteger countOfWorkingDays;
@property (assign, nonatomic) double timeInterval;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    /*
     Ученик.
     1! Создайте класс студент у когторого будет проперти dateOfBirth (дата рождения), которая собственно NSDate.
     2! Инициализируйте NSMutableArray и в цикле создайте 30 студентов.
     3! Каждому установите дату рождения. Возраст рандомный от 16 до 50 лет.
     4! В другом цикле пройдитесь по всему массиву и выведите день рождения каждого студента в адекватном формате.
    */
    
    NSLog(@"~~~~~~~~~~ Schoolboy level ~~~~~~~~~~");
    
    NSMutableArray *students = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < 30; i++) {
        
        NSDateComponents *components = [[NSCalendar currentCalendar] components:
                                        NSCalendarUnitYear |
                                        NSCalendarUnitMonth |
                                        NSCalendarUnitDay
                                                                       fromDate: [NSDate date]];
        
        components.year = (NSInteger)[components year] - (arc4random() % 34 + 16);
        components.month = (arc4random() % 12 + 1);
        components.day = (arc4random() % 28 + 1);
        
        NSDate *date = [[NSCalendar currentCalendar] dateFromComponents:components];
        Student * student = [[Student alloc] initWithDateOfBirth:date];
        [students addObject:student];
    }
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd/MM/YYYY"];
    
    for (Student *student in students)  {
        NSLog(@"%@", [dateFormatter stringFromDate:student.dateOfBirth]);
    }
    
    /*
     Студент.
     5! Отсортируйте массив студентов по дате рождения, начиная от самого юного.
     6! Используя массивы имен и фамилий (по 5-10 имен и фамилий), каждому студенту установите случайное имя и случайную фамилию.
     7! Выведите отсортированных студентов: Имя, Фамилия, год рождения
    */
    
    NSLog(@"~~~~~~~~~~ Student level ~~~~~~~~~~");
    
    NSArray *sortedStudents = [students sortedArrayUsingComparator:^NSComparisonResult(Student *student1, Student *student2) {
        return [student2.dateOfBirth compare:student1.dateOfBirth];
    }];
    
    NSArray *firstNamesArray = [NSArray arrayWithObjects:@"Alex", @"Vova", @"Serg", @"Kola", @"Neo", nil];
    NSArray *secondNamesArray = [NSArray arrayWithObjects:@"Green", @"Yellow", @"Black", @"White", @"Red", nil];
    
    for (Student *student in sortedStudents) {
        student.firstName = [firstNamesArray objectAtIndex:arc4random() % [firstNamesArray count]];
        student.secondName = [secondNamesArray objectAtIndex:arc4random() % [secondNamesArray count]];
        NSLog(@"%@", student);
    }
    
    /*
     Мастер.
     10! Создайте таймер в апп делегате, который отсчитывает один день за пол секунды.
     11! Когда таймер доходит до дня рождения любого их студентов - поздравлять его с днем рождения.
     12! Выведите на экран разницу в возрасте между самым молодым и самым старым студентом (количество лет, месяцев, недель и дней)
    */
    
    NSLog(@"~~~~~~~~~~ Master level ~~~~~~~~~~");
    
    self.timeInterval = -86400;
    self.sortedStudents = sortedStudents;
    self.dateOfTimer = [NSDate dateWithTimeIntervalSinceReferenceDate: self.timeInterval];
    [NSTimer scheduledTimerWithTimeInterval:0.01
                                     target:self
                                   selector:@selector(timerMethodForMasterLevel:)
                                   userInfo:nil
                                    repeats:YES];
    
    Student *youngestStudent = [sortedStudents firstObject];
    Student *oldestStudent = [sortedStudents lastObject];
    
    NSDateComponents *ageDifference = [[NSCalendar currentCalendar] components:
                                       NSCalendarUnitDay |
                                       NSCalendarUnitMonth |
                                       NSCalendarUnitYear
                                                                      fromDate:oldestStudent.dateOfBirth
                                                                        toDate:youngestStudent.dateOfBirth
                                                                       options:0];
    
    NSLog(@"Difference age: year - %ld, month - %ld, days - %ld", (long)ageDifference.year, ageDifference.month, ageDifference.day);
    
    /*
     Супермен.
     13! Выведите на экран день недели, для каждого первого дня каждого месяца в текущем году (от начала до конца)
     14! Выведите дату (число и месяц) для каждого воскресенья в текущем году (от начала до конца)
     15! Выведите количество рабочих дней для каждого месяца в текущем году (от начала до конца)
    */
    
    NSLog(@"~~~~~~~~~~ Superman level ~~~~~~~~~~");
    
    self.countOfWorkingDays = 0;
    self.dateOfTimer = [NSDate dateWithTimeIntervalSinceReferenceDate: self.timeInterval];
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.01
                                                      target:self
                                                    selector:@selector(timerMethodForSupermanLevel:)
                                                    userInfo:nil
                                                     repeats:YES];
    
    [timer setFireDate:[NSDate dateWithTimeIntervalSinceNow:8]];
    
    return YES;
}

#pragma mark -- timer Method Of Master Level --
- (void) timerMethodForMasterLevel:(NSTimer *) timer {
    self.dateOfTimer = [NSDate dateWithTimeInterval: self.timeInterval sinceDate:self.dateOfTimer];
    
    NSDateComponents *currentDateComponents = [[NSCalendar currentCalendar] components: NSCalendarUnitMonth | NSCalendarUnitDay
                                                                              fromDate: self.dateOfTimer];
    
    for (Student *student in self.sortedStudents) {
        NSDateComponents *studentDateComponents = [[NSCalendar currentCalendar] components: NSCalendarUnitMonth | NSCalendarUnitDay
                                                                                  fromDate: student.dateOfBirth];
        
        if ([currentDateComponents isEqual:studentDateComponents]) {
            NSLog(@"Happy Birthday! %@ %@", student.firstName, student.secondName);
        }
    }
    
    if (currentDateComponents.day == 31 & currentDateComponents.month == 12) {
        [timer invalidate];
    }
}

#pragma mark -- timer Method Of Superman Level --
- (void) timerMethodForSupermanLevel:(NSTimer *) timer {
    self.dateOfTimer = [NSDate dateWithTimeInterval: self.timeInterval sinceDate:self.dateOfTimer];
    
    NSDateComponents *currentDateComponents = [[NSCalendar currentCalendar] components:
                                               NSCalendarUnitMonth |
                                               NSCalendarUnitDay |
                                               NSCalendarUnitWeekday                                                                         fromDate:self.dateOfTimer];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    if (currentDateComponents.day == 1) {
        [dateFormatter setDateFormat:@"EEEE"];
        NSLog(@"%@ - Today is first day of Month", [dateFormatter stringFromDate:self.dateOfTimer]);
    }
    
    if (currentDateComponents.weekday == 1) {
        [dateFormatter setDateFormat:@"dd/MM"];
        NSLog(@"%@ - Today is Sunday", [dateFormatter stringFromDate:self.dateOfTimer]);
    }
    
    if (currentDateComponents.weekday != 1 && currentDateComponents.weekday != 6) {
        self.countOfWorkingDays++;
    }
    
    if (currentDateComponents.day == 31 & currentDateComponents.month == 12) {
        NSLog(@"%ld working days in current year", self.countOfWorkingDays);
        [timer invalidate];
    }
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
