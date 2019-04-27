//
//  AppDelegate.m
//  homework10(Notification)
//
//  Created by Алексей on 25/04/2019.
//  Copyright © 2019 Aleksey Suslov. All rights reserved.
//

#import "AppDelegate.h"
#import "Government.h"
#import "Doctor.h"
#import "Pensioner.h"
#import "Businessman.h"

@interface AppDelegate ()

@property (strong, nonatomic) Government *government;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
     
     self.government = [[Government alloc] init];
     
     [[NSNotificationCenter defaultCenter] addObserver:self
     selector:@selector(governmentNotification:)
     name:GovernmentTaxLevelDidChangeNotification
     object:nil];
     
     /*
     Ученик.
     
     1. Используя мой код создать свой проект со своими классами и понять как оно работает
     2. Добавить классы "пенсионер" и "бизнесмен"
     3. Доктор следит за изменением зарплаты, бизнесмен должен следить за изменением налогов, а пенсионер за изменением пенсий.
     4. Все классы: Доктор, Пенсионер и Бизнесмен долджны следить также и за средней ценой на товар.
     */
    
    Pensioner *pensioner1 = [[Pensioner alloc] init];
    Pensioner *pensioner2 = [[Pensioner alloc] init];
    Pensioner *pensioner3 = [[Pensioner alloc] init];
    Pensioner *pensioner4 = [[Pensioner alloc] init];
    Pensioner *pensioner5 = [[Pensioner alloc] init];
    
    pensioner1.pension = pensioner2.pension = pensioner3.pension = pensioner4.pension = pensioner5.pension = self.government.pension;
    
    Businessman *businessman1 = [[Businessman alloc] init];
    Businessman *businessman2 = [[Businessman alloc] init];
    Businessman *businessman3 = [[Businessman alloc] init];
    Businessman *businessman4 = [[Businessman alloc] init];
    Businessman *businessman5 = [[Businessman alloc] init];
    
    businessman1.taxLevel = businessman2.taxLevel = businessman3.taxLevel = businessman4.taxLevel = businessman5.taxLevel = self.government.taxLevel;
    
    Doctor *doctor1 = [[Doctor alloc] init];
    Doctor *doctor2 = [[Doctor alloc] init];
    Doctor *doctor3 = [[Doctor alloc] init];
    Doctor *doctor4 = [[Doctor alloc] init];
    Doctor *doctor5 = [[Doctor alloc] init];
    
    doctor1.salary = doctor2.salary = doctor3.salary = doctor4.salary = doctor5.salary = self.government.salary;
    
    self.government.taxLevel = 5.5;
    self.government.salary = 1100;
    self.government.averagePrice = 15;
    self.government.pension = 550;
    
    self.government.taxLevel = 5.3;
    self.government.salary = 1050;
    self.government.averagePrice = 17;
    self.government.pension = 530;
    
    /*
     Умничка.
     
     5. Каждый из классов следит за инфляцией (процентный рост средней цены на товар) и оценивает свой потенциальный доход по отношению к инфляции, например размер пенсии к возможности купить продукты у пенсионера, либо новая прибыль за вычетом налогов у бизнесмена также по отношению к ценам на товар.
     
     6. Не секрет что изменение этих характеристик оказывает разное влияние на разные слои населения, поэтому пусть в зависимости от уровня покупательской способности каждый класс выдает свои перлы.
     */
    
    self.government.averagePrice = 18;
    self.government.averagePrice = 15;
    self.government.averagePrice = 14;
    self.government.averagePrice = 18;
    self.government.averagePrice = 10;
    
    /*
     Мастер.
     
     7. Подпишите классы на нотификацию ухода приложения в бекграунд, чтобы когда нажимается кнопка HOME и приложение сворачивается, каждый объект заявлял о том что он идет спать
     
     8. Тоже самое сделать для случая, когда приложение возвращается из свернутого состояния
     
     Супермен
     
     9. Создайте свой класс аналог апп делегату, только он не делегат приложения, но слушатель тех же самых нотификаций, какие методы есть у делегата. Грубо говоря у вашего класса должны быть теже методы, что и у апп делегата, но вызываться они должны путем нотификаций
     
     10. Добавьте НСЛоги в каждый метод апп делегата и своего класса
     
     11. Сворачивая и разварачивая приложение добивайтесь вызовов определенный методов делегата и тех же нотификаций и посмотрите что вызывается раньше - метод делегата или нотификация :)
    */
    
    return YES;
}

- (void) governmentNotification:(NSNotification*) notification {
    
    //NSLog(@"governmentNotification userInfo = %@", notification.userInfo);
    
}

- (void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
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
