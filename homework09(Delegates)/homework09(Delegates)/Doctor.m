//
//  Doctor.m
//  homework09(Delegates)
//
//  Created by Алексей on 22/04/2019.
//  Copyright © 2019 Aleksey Suslov. All rights reserved.
//

#import "Doctor.h"

@implementation Doctor

- (void)patientCure:(nonnull Patient *)patient {
    
    switch (patient.symptom) {
        case cough: NSLog(@"1cough %@", patient.name); break;
        case runnyNose: NSLog(@"2runnyNose %@", patient.name); break;
        case soreThroat: NSLog(@"3soreThroat %@", patient.name); break;
        case stomachAche: NSLog(@"4stomachAche %@", patient.name); break;
        case headAche: NSLog(@"5headAche %@", patient.name); break;
        case temperature: NSLog(@"6temperature %@", patient.name); break;
        case none: NSLog(@"7none %@", patient.name); break;
        default:
            break;
    }
    
}

@end
