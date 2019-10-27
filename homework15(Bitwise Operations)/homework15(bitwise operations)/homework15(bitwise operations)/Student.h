//
//  Student.h
//  homework15(bitwise operations)
//
//  Created by Алексей on 12/05/2019.
//  Copyright © 2019 Aleksey Suslov. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum {
    
    StudentSubjectTypeBiology       = 1 << 0,
    StudentSubjectTypeMath          = 1 << 1,
    StudentSubjectTypeDevelopment   = 1 << 2,
    StudentSubjectTypeEngineering   = 1 << 3,
    StudentSubjectTypeArt           = 1 << 4,
    StudentSubjectTypePsychology    = 1 << 5,
    StudentSubjectTypeAnatomy       = 1 << 6
    
} StudentSubjectType;

@interface Student : NSObject

@property (assign, nonatomic) StudentSubjectType subjectType;

@end

NS_ASSUME_NONNULL_END
