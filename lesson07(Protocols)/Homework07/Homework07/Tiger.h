//
//  Tiger.h
//  Homework07
//
//  Created by Алексей on 10/04/2019.
//  Copyright © 2019 Aleksey. All rights reserved.
//

#import "Animal.h"
#import "Runners.h"
#import "Swimmers.h"

NS_ASSUME_NONNULL_BEGIN

@interface Tiger : Animal <Runners, Swimmers>

@property (strong, nonatomic) NSString* maxSpeedOfRun;
@property (strong, nonatomic) NSString* maxLengthOfSwim;

@end

NS_ASSUME_NONNULL_END
