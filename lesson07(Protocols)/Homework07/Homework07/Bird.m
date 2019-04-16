//
//  Bird.m
//  Homework07
//
//  Created by Алексей on 10/04/2019.
//  Copyright © 2019 Aleksey. All rights reserved.
//

#import "Bird.h"

@implementation Bird


- (void) tellMeAboutSelf {
    NSLog(@"I am a Bird, i can %@", self.skill);
}


- (void)fly {
    NSLog(@"🕊");
}

@end
