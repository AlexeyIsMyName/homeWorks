//
//  AppDelegate.m
//  05.NSArray
//
//  Created by Алексей on 03/04/2019.
//  Copyright © 2019 Aleksey. All rights reserved.
//

#import "AppDelegate.h"
#import "Human.h"
#import "Cyclist.h"
#import "Runner.h"
#import "Swimmer.h"
#import "Jumper.h"
#import "Animal.h"
#import "Elephant.h"
#import "Kangaroo.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    Human *human = [[Human alloc] init];
    human.name = @"Petya";
    human.gender = @"Man";
    human.height = 1.8f;
    human.weight = 89.7f;
    
    Cyclist *cyclist = [[Cyclist alloc] init];
    cyclist.name = @"Vova";
    cyclist.gender = @"Man";
    cyclist.height = 1.7f;
    cyclist.weight = 93.3f;
    
    Runner *runner = [[Runner alloc] init];
    runner.name = @"Sveta";
    runner.gender = @"Woman";
    runner.height = 1.6f;
    runner.weight = 75.2f;

    Swimmer *swimmer = [[Swimmer alloc] init];
    swimmer.name = @"Nadya";
    swimmer.gender = @"Woman";
    swimmer.height = 1.7f;
    swimmer.weight = 78.5f;
    
    Jumper *jumper = [[Jumper alloc] init];
    jumper.name = @"Borya";
    jumper.gender = @"Man";
    jumper.height = 1.9f;
    jumper.weight = 68.5f;
    jumper.nickname = @"Boris Britva";
    jumper.maxLength = 15.5f;
    
    Animal *dog = [[Animal alloc] init];
    dog.name = @"Sharik";
    dog.legs = 4;
    
    Elephant *elephant = [[Elephant alloc] init];
    elephant.name = @"Elephant";
    elephant.legs = 4;
    
    Kangaroo *kangaroo = [[Kangaroo alloc] init];
    kangaroo.name = @"Kangaroo";
    kangaroo.legs = 2;
    
    NSArray *livingCreatures = [NSArray arrayWithObjects:human, cyclist, runner, swimmer, jumper, dog, elephant, kangaroo, nil];
    
    for (NSInteger i = [livingCreatures count] - 1; i >= 0; i -= 1) {
        
        if ([[livingCreatures objectAtIndex:i] isKindOfClass:[Animal class]]) {
            Animal *value = [livingCreatures objectAtIndex:i];
            NSLog(@"\n");
            NSLog(@"Name = %@", value.name);
            NSLog(@"Weight = %ld", (long)value.legs);
            [value move];
        }
        
        if ([[livingCreatures objectAtIndex:i] isKindOfClass:[Human class]]) {
            Human *value = [livingCreatures objectAtIndex:i];
            NSLog(@"\n");
            NSLog(@"Name = %@", value.name);
            NSLog(@"Gender = %@", value.gender);
            NSLog(@"Weight = %f", value.weight);
            NSLog(@"Height = %f", value.height);
            [value move];
            
            if ([value isKindOfClass: [Jumper class]]) {
                Jumper *tempValue = (Jumper*)value;
                NSLog(@"Nickname = %@", tempValue.nickname);
                NSLog(@"Max Length of Jump = %f", tempValue.maxLength);
            }
        }
    }
    
    NSArray *humans = [NSArray arrayWithObjects:human, cyclist, runner, swimmer, jumper, nil];
    NSArray *animals = [NSArray arrayWithObjects:dog, elephant, kangaroo, nil];
    
    for (int i = 0; i < fmax([humans count], [animals count]); i += 1) {
        if (i <= [animals count] - 1) {
            Animal *value = [animals objectAtIndex:i];
            NSLog(@"ANIMAL");
            NSLog(@"Name = %@", value.name);
            NSLog(@"Weight = %ld", (long)value.legs);
            [value move];
        }
        
        if (i <= [humans count] - 1) {
            Human *value = [humans objectAtIndex:i];
            NSLog(@"HUMAN");
            NSLog(@"Name = %@", value.name);
            NSLog(@"Gender = %@", value.gender);
            NSLog(@"Weight = %f", value.weight);
            NSLog(@"Height = %f", value.height);
            [value move];
            
            if ([value isKindOfClass: [Jumper class]]) {
                Jumper *tempValue = (Jumper*)value;
                NSLog(@"Nickname = %@", tempValue.nickname);
                NSLog(@"Max Length of Jump = %f", tempValue.maxLength);
            }
        }
    }
    
    NSSortDescriptor *humanSortDescriptor;
    humanSortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    NSArray *sortedArrayHumans = [humans sortedArrayUsingDescriptors:@[humanSortDescriptor]];
    
    NSSortDescriptor *animalSortDescriptor;
    animalSortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    NSArray *sortedArrayAnimals = [animals sortedArrayUsingDescriptors:@[animalSortDescriptor]];
    
    NSArray *creatures = [sortedArrayHumans arrayByAddingObjectsFromArray:sortedArrayAnimals];
    
    for (NSInteger i = 0; i < [creatures count]; i += 1) {
        if ([[creatures objectAtIndex:i] isKindOfClass:[Animal class]]) {
            NSLog(@"ANIMAL");
            Animal *value = (Animal*)[creatures objectAtIndex:i];
            NSLog(@"Name = %@", value.name);
        }
        
        if ([[creatures objectAtIndex:i] isKindOfClass:[Human class]]) {
            NSLog(@"HUMAN");
            Human *value = (Human*)[creatures objectAtIndex:i];
            NSLog(@"Name = %@", value.name);
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
