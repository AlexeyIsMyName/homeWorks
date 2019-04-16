//
//  Runner.h
//  Homework07
//
//  Created by Алексей on 10/04/2019.
//  Copyright © 2019 Aleksey. All rights reserved.
//

#import "Human.h"
#import "Runners.h"

NS_ASSUME_NONNULL_BEGIN

@interface Runner : Human <Runners>

@property (strong, nonatomic) NSString* maxSpeedOfRun;

@end

NS_ASSUME_NONNULL_END
