//
//  Student.m
//  homework15(bitwise operations)
//
//  Created by Алексей on 12/05/2019.
//  Copyright © 2019 Aleksey Suslov. All rights reserved.
//

#import "Student.h"

@implementation Student

- (NSString *) answerByType:(StudentSubjectType) type {
    return self.subjectType & type ? @"YES" : @"NO";
}

- (NSString *) description {
    return [NSString stringWithFormat:  @"\nStudent studies:\n"
            "Biology = %@\n"
            "Math = %@\n"
            "Development = %@\n"
            "Engineering = %@\n"
            "Art = %@\n"
            "Phecology = %@\n"
            "Anatomy = %@\n",
            [self answerByType:StudentSubjectTypeBiology],
            [self answerByType:StudentSubjectTypeMath],
            [self answerByType:StudentSubjectTypeDevelopment],
            [self answerByType:StudentSubjectTypeEngineering],
            [self answerByType:StudentSubjectTypeArt],
            [self answerByType:StudentSubjectTypePhecology],
            [self answerByType:StudentSubjectTypeAnatomy]];
}

@end
