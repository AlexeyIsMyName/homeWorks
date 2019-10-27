//
//  Student.m
//  homework12(Blocks)
//
//  Created by Алексей on 04/05/2019.
//  Copyright © 2019 Aleksey Suslov. All rights reserved.
//

#import "Student.h"

@implementation Student

- (instancetype)initWithName:(NSString *)name
                       sName:(NSString *)sName {
    if (self) {
        self.name = name;
        self.sName = sName;
    }
    return self;
};

@end
