//
//  AppDelegate.m
//  Homework07
//
//  Created by Алексей on 10/04/2019.
//  Copyright © 2019 Aleksey. All rights reserved.
//

#import "AppDelegate.h"
#import "Jumpers.h"
#import "Swimmers.h"
#import "Runners.h"
#import "Flyers.h"
#import "Human.h"
#import "Runner.h"
#import "Swimmer.h"
#import "Jumper.h"
#import "Skydiver.h"
#import "Animal.h"
#import "Kangaroo.h"
#import "Tiger.h"
#import "Bird.h"
#import "Fish.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    Human* human = [[Human alloc] init];
    human.name = @"Vlodimir";
    
    Runner* runner = [[Runner alloc] init];
    runner.name = @"Boris";
    runner.maxSpeedOfRun = @"I like running, my max speed is 30 km/h";
    
    Swimmer* swimmer = [[Swimmer alloc] init];
    swimmer.name = @"Aleksey";
    swimmer.maxLengthOfSwim = @"I like swimming, my max length is 3 kilometers";
    
    Jumper* jumper = [[Jumper alloc] init];
    jumper.name = @"Aleksandr";
    jumper.maxHeightOfJump = @"I like jumping, my max height is 150 centimeters";
    
    Skydiver* skydiver = [[Skydiver alloc] init];
    skydiver.name = @"Dmitry";
    skydiver.maxDistanceOfFly = @"I like skydiving, my max distance is 10 kilometers";
    
    Animal* dog = [[Animal alloc] init];
    dog.skill = @"Gav-Gav";
    
    Kangaroo* kangaroo = [[Kangaroo alloc] init];
    kangaroo.skill = @"highly jumping";
    kangaroo.maxHeightOfJump = @"Kangaroo jumping higher 3 meters";
    
    Tiger* tiger = [[Tiger alloc] init];
    tiger.skill = @"quickly running";
    tiger.maxSpeedOfRun = @"Tigers speed is over 50 km/h";
    tiger.maxLengthOfSwim = @"Tigers swimming on less length";
    
    Bird* bird = [[Bird alloc] init];
    bird.skill = @"flying";
    bird.maxDistanceOfFly = @"Birds flying on the distance over 6000 kilometers ";
    
    Fish* fish = [[Fish alloc] init];
    fish.skill = @"swimming";
    fish.maxLengthOfSwim = @"Fishes swimming on length over 100 kilometers ";
    
    
    NSArray *livingCreatures = [NSArray arrayWithObjects:
                                human,
                                runner,
                                swimmer,
                                jumper,
                                skydiver,
                                dog,
                                kangaroo,
                                tiger,
                                bird,
                                fish,
                                nil];
    
    
    for (id value in livingCreatures) {
        
        NSLog(@"\n");
        [value tellMeAboutSelf];
        
        NSString* string = @"";
        
        if ([value conformsToProtocol:@protocol(Jumpers)]) {
            string = [NSString stringWithFormat:@"%@. %@", string, [value maxHeightOfJump]];
            //string = [value maxHeightOfJump];
            [value jump];
        }
        
        if ([value conformsToProtocol:@protocol(Swimmers)]) {
            string = [NSString stringWithFormat:@"%@. %@", string, [value maxLengthOfSwim]];
            //string = [value maxLengthOfSwim];
            [value swim];
        }
        
        if ([value conformsToProtocol:@protocol(Runners)]) {
            string = [NSString stringWithFormat:@"%@. %@", string, [value maxSpeedOfRun]];
            //string = [value maxSpeedOfRun];
            [value run];
        }
        
        if ([value conformsToProtocol:@protocol(Flyers)]) {
            string = [NSString stringWithFormat:@"%@. %@", string, [value maxDistanceOfFly]];
            //string = [value maxDistanceOfFly];
            [value fly];
        }
        
        
        if ([string isEqual: @""]) {
            NSLog(@"I am lazy");
        } else {
            NSLog(@"%@", string);
        }
        
        
        if ([value respondsToSelector:@selector(testOptionalVoid)]) {
            NSLog(@"Print from optional void - %@", [value testOptionalVoid]);
        }
    }
    
    /*
     Задание такое:
     1. Реализуйте протоколы Jumpers, Swimmers, Runners. Каждый протокол должен иметь пару свойств, например скорость или максимальная высота прыжка и пару методов, например прыгать или плыть, нырять и тд. Включите фантазию!!!
     
     2. Часть методов делайте обязательными (например у пловцов обязательный метод это плыть а у бегунов - бежать, логично?), а другую часть не обязательными.
     
     3. Используйте классы из задания про массивы, там где у вас люди и животные. Например у кенгуру и у особых спортсменов реализуйте протокол Jumpers, тоже самое с другими протоколами. Пусть каждый протокол будет реализован как некоторыми классами животных, так и некоторыми классами людей.
     
     4. Положите всех в одни массив. Тех кто прыгает заставьте прыгать и рассказывать про свои свойства. Причем у некоторых объектов пусть будут одни необязательные свойства или методы, а у других другие. Тот кто бегает пусть бегает, а тот кто плавает, пусть плавает. Тот кто ничего не делает должен быть выведен на экран как лодырь :)
     
     5. Сделайте так чтобы один какой-то класс мог и бегать и прыгать и плавать и посмотрите как он себя поведет в цикле.
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
