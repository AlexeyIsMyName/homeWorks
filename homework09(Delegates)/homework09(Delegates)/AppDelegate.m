//
//  AppDelegate.m
//  homework09(Delegates)
//
//  Created by Алексей on 22/04/2019.
//  Copyright © 2019 Aleksey Suslov. All rights reserved.
//

#import "AppDelegate.h"
#import "Doctor.h"
#import "DoctorsFriend.h"
#import "Patient.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    /*
     
     Ученик:
     
     1. Создать пару пациентов и доктора по тому же принципу что и в видео. (Доктор делегат у пациентов)
     2. У пациента пусть будет температура и другие симптомы, по которым доктор может принимать решение.
     3. У пациента сделайте метод типа стало хуже и пусть когда станет хуже, то он идет к доктору
     4. Всех пациентов объедините в массив и в цикле вызовите метод "стало хуже".
     5. Доктор должен лечить каждого согласно симптомам.
     
    */
    
    NSLog(@" ~~~~~~~~~~ level schoolboy  ~~~~~~~~~~ ");
    
    Patient *patient1 = [[Patient alloc] initWithName:@"Vova" temperature:36.6f symptom: cough];
    Patient *patient2 = [[Patient alloc] initWithName:@"Aleksey" temperature:36.6f symptom: runnyNose];
    Patient *patient3 = [[Patient alloc] initWithName:@"Boris" temperature:36.6f symptom: soreThroat];
    Patient *patient4 = [[Patient alloc] initWithName:@"Gosha" temperature:36.6f symptom: stomachAche];
    Patient *patient5 = [[Patient alloc] initWithName:@"Tolik" temperature:36.6f symptom: headAche];
    Patient *patient6 = [[Patient alloc] initWithName:@"Sveta" temperature:36.6f symptom: temperature];
    Patient *patient7 = [[Patient alloc] initWithName:@"Dasha" temperature:36.6f symptom: none];
    
    Doctor *doctor = [[Doctor alloc] init];
    
    patient1.delegate = doctor;
    patient2.delegate = doctor;
    patient3.delegate = doctor;
    patient4.delegate = doctor;
    patient5.delegate = doctor;
    patient6.delegate = doctor;
    patient7.delegate = doctor;
    
    NSArray *patients = [NSArray arrayWithObjects:
                         patient1,
                         patient2,
                         patient3,
                         patient4,
                         patient5,
                         patient6,
                         patient7,
                         nil];
    
    for (Patient *value in patients) {
        [value goToDoctor];
    }
    
    /*
     
     Студент:
     
     6. Создайте другой класс доктора, не наследника от первого доктора, например друг :)
     7. этот друг должен лечить своих пациентов своими собственными методами и короче плохой он доктор
     8. пусть кто-то ходит к врачу, а кто-то к нему
     9. создайте пару разных объектов класса друг и пусть они лечат своих пациентов (чтобы понять что делегат это не класс, а объект)
     
     */
    NSLog(@" ~~~~~~~~~~ level student  ~~~~~~~~~~ ");
    
    DoctorsFriend *doctorsFriend = [[DoctorsFriend alloc] init];
    
    patient2.delegate = doctorsFriend;
    patient4.delegate = doctorsFriend;
    patient6.delegate = doctorsFriend;
    
    NSArray *patients2 = [NSArray arrayWithObjects:
                         patient1,
                         patient2,
                         patient3,
                         patient4,
                         patient5,
                         patient6,
                         patient7,
                         nil];
    
    for (Patient *value in patients2) {
        [value goToDoctor];
    }
    
    /*
     
     Мастер:
     
     10. Создайте список частей тела в делегате пациента (голова, живот, нога и тд) и когда пациент приходит к врачу, пусть говорит что болит.
     11. Доктор должен принимать во внимание что болит
     12. Создайте у доктора метод "рапорт". Пусть в конце дня, когда все уже нажаловались достаточно, доктор составит рапорт (выдаст имена) тех у кого болит голова, потом тех у кого болел живот и тд
     
     */
    
    NSLog(@" ~~~~~~~~~~ level master  ~~~~~~~~~~ ");
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    /*
    
     Супермен
     
     13. Создайте в классе пациента проперти - оценка доктору.
     14. Когда доктор вам назначает лечение некоторые пациенты должны стать недовольны.
     15. В конце дня после того как все лечение будет сделано и доктор напишет рапорт, надо пройтись по пациентам и всем недовольным поменять доктора.
     16. Начать новый день и убедиться что Недовольные пациенты таки поменяли доктора.

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
