//
//  Doctor.h
//  homework09(Delegates)
//
//  Created by Алексей on 22/04/2019.
//  Copyright © 2019 Aleksey Suslov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Patient.h"

NS_ASSUME_NONNULL_BEGIN

@interface Doctor : NSObject <PatientDelegate>

- (void) showRaport;
- (void) cleanRaport;

@end

NS_ASSUME_NONNULL_END
