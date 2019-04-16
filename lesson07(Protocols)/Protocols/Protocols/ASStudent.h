//
//  ASStudent.h
//  Protocols
//
//  Created by Алексей on 10/04/2019.
//  Copyright © 2019 Aleksey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASPatient.h"

NS_ASSUME_NONNULL_BEGIN

@interface ASStudent : NSObject <ASPatient>

@property (strong, nonatomic) NSString* universityName;
@property (strong, nonatomic) NSString* name;


- (void) study;


@end

NS_ASSUME_NONNULL_END
