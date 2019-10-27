//
//  DoctorsFriend.h
//  homework09(Delegates)
//
//  Created by Алексей on 24/04/2019.
//  Copyright © 2019 Aleksey Suslov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Patient.h"

NS_ASSUME_NONNULL_BEGIN

@interface DoctorsFriend : NSObject <PatientDelegate>

@end

NS_ASSUME_NONNULL_END
