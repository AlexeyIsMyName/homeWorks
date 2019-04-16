//
//  Skydiver.m
//  Homework07
//
//  Created by Алексей on 10/04/2019.
//  Copyright © 2019 Aleksey. All rights reserved.
//

#import "Skydiver.h"

@implementation Skydiver


- (void) tellMeAboutSelf {
    NSLog(@"I am a Skidiver, my name is %@", self.name);
}


- (void)fly {
    NSLog(@"Let's go flying with me 🙋🏼‍♂️");
}

-(NSString*) testOptionalVoid {
    return @"I like flying in New Zealand";
}

@end
