//
//  Kangaroo.m
//  Homework07
//
//  Created by Алексей on 10/04/2019.
//  Copyright © 2019 Aleksey. All rights reserved.
//

#import "Kangaroo.h"

@implementation Kangaroo


- (void) tellMeAboutSelf {
    NSLog(@"I am a Kangaroo, i can %@", self.skill);
}


- (void)jump {
    NSLog(@"🦘");
}

@end
