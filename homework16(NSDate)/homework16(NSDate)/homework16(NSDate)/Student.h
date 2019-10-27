//
//  Student.h
//  homework16(NSDate)
//
//  Created by Алексей on 16/05/2019.
//  Copyright © 2019 Aleksey Suslov. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Student : NSObject

@property (strong, nonatomic) NSString *firstName;
@property (strong, nonatomic) NSString *secondName;
@property (strong, nonatomic) NSDate *dateOfBirth;

- (instancetype)initWithDateOfBirth:(NSDate *)dateOfBirth;

@end

NS_ASSUME_NONNULL_END
