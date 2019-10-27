//
//  Student.h
//  homework12(Blocks)
//
//  Created by Алексей on 04/05/2019.
//  Copyright © 2019 Aleksey Suslov. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Student : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *sName;

- (instancetype)initWithName:(NSString *)name
                       sName:(NSString *)sName;

@end

NS_ASSUME_NONNULL_END
