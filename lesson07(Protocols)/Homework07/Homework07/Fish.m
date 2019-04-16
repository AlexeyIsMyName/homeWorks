//
//  Fish.m
//  Homework07
//
//  Created by Алексей on 10/04/2019.
//  Copyright © 2019 Aleksey. All rights reserved.
//

#import "Fish.h"

@implementation Fish


- (void) tellMeAboutSelf {
    NSLog(@"I am a Fish, i can %@", self.skill);
}


- (void)swim {
    NSLog(@"🐠");
}

@end
