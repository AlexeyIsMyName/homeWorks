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

- (instancetype)initWithName:(NSString *)name
                 temperature:(CGFloat)temperature
                     symptom:(Symptom)symptom {
    if (self) {
        self.name = name;
        self.temperature = temperature;
        self.symptom = symptom;
    }
    return self;
}

@end
