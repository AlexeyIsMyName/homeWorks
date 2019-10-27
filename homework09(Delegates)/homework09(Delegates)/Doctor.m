//
//  Doctor.m
//  homework09(Delegates)
//
//  Created by Алексей on 22/04/2019.
//  Copyright © 2019 Aleksey Suslov. All rights reserved.
//

#import "Doctor.h"
@interface Doctor()

@property (strong, nonatomic) NSMutableDictionary *raport;

@end


@implementation Doctor

- (instancetype)init {
    self = [super init];
    if (self) {
        self.raport = [NSMutableDictionary dictionary];
    }
    return self;
}

- (void)patientCure:(nonnull Patient *)patient {
    switch (patient.symptom) {
        case SymptomCough:
            patient.rateDoc = arc4random_uniform(5);
            NSLog(@"Doc said: %@ take a cough pill", patient.name);
            break;
        case SymptomRunnyNose:
            patient.rateDoc = arc4random_uniform(5);
            NSLog(@"Doc said: %@ take a drops from the common cold", patient.name);
            break;
        case SymptomSoreThroat:
            patient.rateDoc = arc4random_uniform(5);
            NSLog(@"Doc said: %@ take a throat spray", patient.name);
            break;
        case SymptomStomachAche:
            patient.rateDoc = arc4random_uniform(5);
            NSLog(@"Doc said: %@ buy Mezim", patient.name);
            break;
        case SymptomHeadAche:
            patient.rateDoc = arc4random_uniform(5);
            NSLog(@"Doc said: %@ head not ass", patient.name);
            break;
        case SymptomTemperature:
            patient.rateDoc = arc4random_uniform(5);
            NSLog(@"Doc said: %@ take aspirin", patient.name);
            break;
        case SymptomNone:
            patient.rateDoc = arc4random_uniform(5);
            NSLog(@"Doc said: %@ go home, you are not sick", patient.name);
            break;
        default:
            break;
    }
    
    switch (patient.organ) {
        case OrganHead: [self.raport setObject:@"Head" forKey:patient.name]; break;
        case OrganStomach: [self.raport setObject:@"Stomach" forKey:patient.name]; break;
        case OrganLeg: [self.raport setObject:@"Leg" forKey:patient.name]; break;
        case OrganThroat: [self.raport setObject:@"Throat" forKey:patient.name]; break;
        case OrganHeart: [self.raport setObject:@"Heart" forKey:patient.name]; break;
        case OrganTooth: [self.raport setObject:@"Tooth" forKey:patient.name]; break;
        case OrganNothing: [self.raport setObject:@"Noting" forKey:patient.name]; break;
        default:
            break;
    }
}

- (void) showRaport {
    NSLog(@"%@", self.raport);
}

- (void) cleanRaport {
    self.raport = [NSMutableDictionary dictionary];
}

@end
