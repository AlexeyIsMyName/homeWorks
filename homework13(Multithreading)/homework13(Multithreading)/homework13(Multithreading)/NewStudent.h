//
//  NewStudent.h
//  homework13(Multithreading)
//
//  Created by Алексей on 10/05/2019.
//  Copyright © 2019 Aleksey Suslov. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NewStudent : NSObject

@property (strong, nonatomic) NSString *name;

- (void) guessAnswer:(NSInteger) number range:(NSRange) range;

- (void) guessAnswer:(NSInteger) number range:(NSRange) range andResultBlock:(void(^)(NSInteger, NSString *, NSInteger, double)) resultBlock;

- (instancetype)initWithName: (NSString *) name;

@end

NS_ASSUME_NONNULL_END
