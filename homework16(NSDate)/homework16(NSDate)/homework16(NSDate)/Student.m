//
//  Student.m
//  homework16(NSDate)
//
//  Created by Алексей on 16/05/2019.
//  Copyright © 2019 Aleksey Suslov. All rights reserved.
//

#import "Student.h"

@implementation Student


- (instancetype)initWithDateOfBirth: (NSDate *) dateOfBirth
{
    self = [super init];
    if (self) {
        self.dateOfBirth = dateOfBirth;
    }
    return self;
}

@end
