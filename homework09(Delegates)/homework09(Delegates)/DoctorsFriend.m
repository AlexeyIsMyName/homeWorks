//
//  DoctorsFriend.m
//  homework09(Delegates)
//
//  Created by Алексей on 24/04/2019.
//  Copyright © 2019 Aleksey Suslov. All rights reserved.
//

#import "DoctorsFriend.h"

@implementation DoctorsFriend

- (void)patientCure:(nonnull Patient *)patient {
    NSLog(@"Docs friend said: %@ drink Bitner in any situation ", patient.name);
}

@end
