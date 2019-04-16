//
//  ASStudent.h
//  TypesTest
//
//  Created by Алексей on 09/04/2019.
//  Copyright © 2019 Aleksey. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum {
    ASGenderMale,
    ASGenderFemale
} ASGender;

//typedef NSInteger ASTaburetka;

@interface ASStudent : NSObject


@property (strong, nonatomic) NSString* name;

@property (assign, nonatomic) ASGender gender;


@end

NS_ASSUME_NONNULL_END
