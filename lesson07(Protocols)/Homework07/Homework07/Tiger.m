//
//  Tiger.m
//  Homework07
//
//  Created by Алексей on 10/04/2019.
//  Copyright © 2019 Aleksey. All rights reserved.
//

#import "Tiger.h"

@implementation Tiger


- (void) tellMeAboutSelf {
    NSLog(@"I am a Tiger, i can %@", self.skill);
}


- (void)run {
    NSLog(@"🐆");
}

- (void)swim {
    NSLog(@"🐆🌊");
}

@end
