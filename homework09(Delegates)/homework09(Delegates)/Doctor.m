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
        case cough: NSLog(@"Doc said: %@ take a cough pill ", patient.name); break;
        case runnyNose: NSLog(@"Doc said: %@ take a drops from the common cold", patient.name); break;
        case soreThroat: NSLog(@"Doc said: %@ take a throat spray", patient.name); break;
        case stomachAche: NSLog(@"Doc said: %@ buy Mezim", patient.name); break;
        case headAche: NSLog(@"Doc said: %@ head not ass", patient.name); break;
        case temperature: NSLog(@"Doc said: %@ take aspirin", patient.name); break;
        case none: NSLog(@"Doc said: %@ go home, you are not sick", patient.name); break;
        default:
            break;
    }
}

- (void) showRaport {
    
}

- (void) cleanRaport {
    
}



@end
