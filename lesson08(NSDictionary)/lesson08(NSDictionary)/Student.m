//
//  Student.m
//  lesson08(NSDictionary)
//
//  Created by Алексей on 17/04/2019.
//  Copyright © 2019 Aleksey Suslov. All rights reserved.
//

#import "Student.h"

@interface Student()

@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSString* surname;

@end

@implementation Student

- (NSString*) fullname {
    return [NSString stringWithFormat: @"%@ %@", self.name, self.surname];
}

- (void) hello {
    NSLog(@"Hello! My full name is %@", [self fullname]);
}

- (instancetype)initWithName:(NSString *)name
                     surname:(NSString *)surname {
    if (self) {
        self.name = name;
        self.surname = surname;
    }
    return self;
}

@end

