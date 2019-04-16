//
//  Skydiver.h
//  Homework07
//
//  Created by Алексей on 10/04/2019.
//  Copyright © 2019 Aleksey. All rights reserved.
//

#import "Human.h"
#import "Flyers.h"

NS_ASSUME_NONNULL_BEGIN

@interface Skydiver : Human <Flyers>

@property (strong, nonatomic) NSString* maxDistanceOfFly;

@end

NS_ASSUME_NONNULL_END
