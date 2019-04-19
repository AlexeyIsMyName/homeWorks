//
//  Student.h
//  lesson08(NSDictionary)
//
//  Created by Алексей on 17/04/2019.
//  Copyright © 2019 Aleksey Suslov. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Student : NSObject

- (void) hello;

- (instancetype)initWithName:(NSString *)name
                     surname:(NSString *)surname;

@end

NS_ASSUME_NONNULL_END
