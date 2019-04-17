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


@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSString* surname;

- (NSString*) fullname;

- (void) hello;


@end

NS_ASSUME_NONNULL_END
