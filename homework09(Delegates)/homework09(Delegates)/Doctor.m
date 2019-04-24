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
        case cough:
            patient.rateDoc = arc4random_uniform(5);
            NSLog(@"Doc said: %@ take a cough pill", patient.name);
            break;
        case runnyNose:
            patient.rateDoc = arc4random_uniform(5);
            NSLog(@"Doc said: %@ take a drops from the common cold", patient.name);
            break;
        case soreThroat:
            patient.rateDoc = arc4random_uniform(5);
            NSLog(@"Doc said: %@ take a throat spray", patient.name);
            break;
        case stomachAche:
            patient.rateDoc = arc4random_uniform(5);
            NSLog(@"Doc said: %@ buy Mezim", patient.name);
            break;
        case headAche:
            patient.rateDoc = arc4random_uniform(5);
            NSLog(@"Doc said: %@ head not ass", patient.name);
            break;
        case temperature:
            patient.rateDoc = arc4random_uniform(5);
            NSLog(@"Doc said: %@ take aspirin", patient.name);
            break;
        case none:
            patient.rateDoc = arc4random_uniform(5);
            NSLog(@"Doc said: %@ go home, you are not sick", patient.name);
            break;
        default:
            break;
    }
    
    switch (patient.organ) {
        case head: [self.raport setObject:@"Head" forKey:patient.name]; break;
        case stomach: [self.raport setObject:@"Stomach" forKey:patient.name]; break;
        case leg: [self.raport setObject:@"Leg" forKey:patient.name]; break;
        case throat: [self.raport setObject:@"Throat" forKey:patient.name]; break;
        case heart: [self.raport setObject:@"Heart" forKey:patient.name]; break;
        case tooth: [self.raport setObject:@"Tooth" forKey:patient.name]; break;
        case nothing: [self.raport setObject:@"Noting" forKey:patient.name]; break;
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
