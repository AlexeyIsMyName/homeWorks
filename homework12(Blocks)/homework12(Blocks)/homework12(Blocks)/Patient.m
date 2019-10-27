//
//  Patient.m
//  homework12(Blocks)
//
//  Created by Алексей on 04/05/2019.
//  Copyright © 2019 Aleksey Suslov. All rights reserved.
//

#import "Patient.h"

@implementation Patient

- (instancetype)initWithName:(NSString *) name sName:(NSString *) sName {
    self = [super init];
    if (self) {
        self.name = name;
        self.sName = sName;
        self.isFeelingGood = arc4random() % 2;
        self.organ = arc4random() % 4;
    }
    return self;
}

- (instancetype)initWithBlock:(void(^)(Patient *patient)) block name:(NSString *) name sName:(NSString *) sName {
    self = [super init];
    if (self) {
        self.name = name;
        self.sName = sName;
        self.isFeelingGood = arc4random() % 2;
        self.organ = arc4random() % 4;
        [self performSelector:@selector(feelingIll:) withObject:block afterDelay:arc4random() % 10 + 5];
    }
    return self;
}

- (void) takePill {
    NSLog(@"Patient %@ %@ now I give nice pill for you!", self.name, self.sName);
}

- (void) makeShot {
    NSLog(@"Patient %@ %@ now I do big shot for you!", self.name, self.sName);
}

- (void) eatHealthyFood {
    NSLog(@"Patient %@ %@ eat more healthy food!", self.name, self.sName);
}

- (void) takeThroatDrops {
    NSLog(@"Patient %@ %@ buy throat drops in pharmacy!", self.name, self.sName);
}

- (void) feelingIll:(void (^)(Patient *)) block {
    NSLog(@"%@ %@, I feeling ill!", self.name, self.sName);
    block(self);
}

@end
