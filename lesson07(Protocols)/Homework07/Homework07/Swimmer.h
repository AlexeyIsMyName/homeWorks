//
//  Swimmer.h
//  Homework07
//
//  Created by Алексей on 10/04/2019.
//  Copyright © 2019 Aleksey. All rights reserved.
//

#import "Human.h"
#import "Swimmers.h"

NS_ASSUME_NONNULL_BEGIN

@interface Swimmer : Human <Swimmers>

@property (strong, nonatomic) NSString* maxLengthOfSwim;

@end

NS_ASSUME_NONNULL_END
