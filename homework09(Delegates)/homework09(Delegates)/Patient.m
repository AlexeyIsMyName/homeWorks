//
//  Patient.m
//  homework09(Delegates)
//
//  Created by Алексей on 22/04/2019.
//  Copyright © 2019 Aleksey Suslov. All rights reserved.
//

#import "Patient.h"

@implementation Patient

- (void) goToDoctor {
    [self.delegate patientCure:self];
}

- (BOOL) rateTheDoctor {
    if (self.rateDoc < 3) {
        NSLog(@"%@ said - This doctor's rate is low! Please change my doctor to another!", self.name);
        return YES;
    } else {
        NSLog(@"%@ said - This doctor's rate is high! Give him a bonus!", self.name);
        return NO;
    }
}

- (instancetype)initWithName:(NSString *)name
                 temperature:(CGFloat)temperature
                     symptom:(Symptom)symptom
                       organ:(Organ)organ {
    if (self) {
        self.name = name;
        self.temperature = temperature;
        self.symptom = symptom;
        self.organ = organ;
    }
    return self;
}

@end
