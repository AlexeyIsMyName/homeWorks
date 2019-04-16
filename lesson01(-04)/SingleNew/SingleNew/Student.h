//
//  Student.h
//  SingleNew
//
//  Created by Алексей on 02/04/2019.
//  Copyright © 2019 Aleksey. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Student : NSObject

@property (strong, nonatomic) NSString *name;
@property (assign, nonatomic) NSInteger age;

- (NSString *) howOldAreYou;



@end

NS_ASSUME_NONNULL_END
